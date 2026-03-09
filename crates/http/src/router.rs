use crate::Request;
use crate::Response;
use crate::wasi::http::types::Method;
use matchit::Router as MatchitRouter;
use std::collections::HashMap;

pub trait HandlerFn: Send + Sync + 'static {
    fn call(&self, req: &Request) -> Response;
}

impl<F> HandlerFn for F
where
    F: Fn(&Request) -> Response + Send + Sync + 'static,
{
    fn call(&self, req: &Request) -> Response {
        (self)(req)
    }
}

pub struct Router {
    routes: HashMap<String, MatchitRouter<Box<dyn HandlerFn>>>,
}

impl Router {
    pub fn new() -> Self {
        Self {
            routes: HashMap::new(),
        }
    }

    pub fn get<F>(self, path: &str, handler: F) -> Self
    where
        F: HandlerFn,
    {
        self.add_route(Method::Get, path, handler)
    }

    pub fn post<F>(self, path: &str, handler: F) -> Self
    where
        F: HandlerFn,
    {
        self.add_route(Method::Post, path, handler)
    }

    pub fn put<F>(self, path: &str, handler: F) -> Self
    where
        F: HandlerFn,
    {
        self.add_route(Method::Put, path, handler)
    }

    pub fn delete<F>(self, path: &str, handler: F) -> Self
    where
        F: HandlerFn,
    {
        self.add_route(Method::Delete, path, handler)
    }

    fn add_route<F>(mut self, method: Method, path: &str, handler: F) -> Self
    where
        F: HandlerFn,
    {
        let method_str = Self::method_to_string(&method);

        // Get or create the router for this method
        let router = self
            .routes
            .entry(method_str)
            .or_insert_with(MatchitRouter::new);

        // matchit might panic if route is invalid, but we assume valid paths
        router.insert(path, Box::new(handler)).unwrap();
        self
    }

    fn method_to_string(method: &Method) -> String {
        match method {
            Method::Get => "GET".to_string(),
            Method::Post => "POST".to_string(),
            Method::Put => "PUT".to_string(),
            Method::Delete => "DELETE".to_string(),
            Method::Patch => "PATCH".to_string(),
            Method::Head => "HEAD".to_string(),
            Method::Options => "OPTIONS".to_string(),
            Method::Connect => "CONNECT".to_string(),
            Method::Trace => "TRACE".to_string(),
            Method::Other(s) => s.clone(),
        }
    }

    pub fn handle(&self, mut req: Request) -> Response {
        let method_str = Self::method_to_string(&req.method);

        // Check if the method router exists and try to match the path
        if let Some(router) = self.routes.get(&method_str) {
            match router.at(&req.path) {
                Ok(matched) => {
                    // Store path parameters in the request
                    for (key, value) in matched.params.iter() {
                        req.path_params.insert(key.to_string(), value.to_string());
                    }
                    return matched.value.call(&req);
                }
                Err(_) => {
                    // Path not found for this method, check if it exists for other methods
                    for (other_method, other_router) in &self.routes {
                        if other_method != &method_str {
                            if other_router.at(&req.path).is_ok() {
                                // Path exists but wrong method
                                return Response::method_not_allowed();
                            }
                        }
                    }
                    // Path doesn't exist at all
                    return Response::not_found();
                }
            }
        }

        // Method router doesn't exist, check if path exists for other methods
        for other_router in self.routes.values() {
            if other_router.at(&req.path).is_ok() {
                return Response::method_not_allowed();
            }
        }

        // Path doesn't exist at all
        Response::not_found()
    }
}
