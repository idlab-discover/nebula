use crate::wasi::http::types::{IncomingRequest, Method};
use crate::wasi::io::streams::StreamError;

use serde::de::DeserializeOwned;
use std::collections::HashMap;
use url::Url;

pub struct Request {
    pub method: Method,
    pub path: String,
    pub query: HashMap<String, String>,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
    pub path_params: HashMap<String, String>,
}

impl Request {
    pub fn from_wasi(req: IncomingRequest) -> anyhow::Result<Self> {
        let method = req.method();
        let path_with_query = req.path_with_query().unwrap_or_else(|| "/".to_string());

        // Parse URL to get path and query
        // We need a base URL to parse relative paths
        let base = Url::parse("http://localhost")?;
        let url = base.join(&path_with_query)?;
        let path = url.path().to_string();

        let query: HashMap<String, String> = url.query_pairs().into_owned().collect();

        // Headers
        let headers_handle = req.headers();
        let headers_entries = headers_handle.entries();
        let headers: Vec<(String, String)> = headers_entries
            .into_iter()
            .map(|(k, v)| (k, String::from_utf8_lossy(&v).to_string()))
            .collect();

        // Body
        let incoming_body = req
            .consume()
            .map_err(|_| anyhow::anyhow!("Failed to consume body"))?;
        let stream = incoming_body
            .stream()
            .map_err(|_| anyhow::anyhow!("Failed to get stream"))?;

        let mut body = Vec::new();
        loop {
            match stream.blocking_read(4096) {
                Ok(chunk) => {
                    if chunk.is_empty() {
                        break;
                    }
                    body.extend_from_slice(&chunk);
                }
                Err(StreamError::Closed) => break,
                Err(e) => return Err(anyhow::anyhow!("Stream error: {:?}", e)),
            }
        }

        Ok(Request {
            method,
            path,
            query,
            headers,
            body,
            path_params: HashMap::new(),
        })
    }

    pub fn json<T: DeserializeOwned>(&self) -> anyhow::Result<T> {
        serde_json::from_slice(&self.body).map_err(|e| anyhow::anyhow!(e))
    }

    pub fn param(&self, name: &str) -> Option<&String> {
        self.path_params.get(name)
    }

    pub fn method(&self) -> String {
        match &self.method {
            Method::Get => "GET".to_string(),
            Method::Post => "POST".to_string(),
            Method::Put => "PUT".to_string(),
            Method::Delete => "DELETE".to_string(),
            Method::Patch => "PATCH".to_string(),
            Method::Head => "HEAD".to_string(),
            Method::Options => "OPTIONS".to_string(),
            Method::Connect => "CONNECT".to_string(),
            Method::Trace => "TRACE".to_string(),
            Method::Other(other) => other.clone(),
        }
    }
}
