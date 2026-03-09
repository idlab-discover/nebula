use crate::wasi::http::types::{
    Fields, OutgoingBody, OutgoingResponse, ResponseOutparam, StatusCode,
};

pub struct Response {
    pub status: u16,
    pub body: Vec<u8>,
    pub headers: Vec<(String, String)>,
}

impl Response {
    pub fn new(status: u16) -> Self {
        Self {
            status,
            body: Vec::new(),
            headers: Vec::new(),
        }
    }

    pub fn ok() -> Self {
        Self::new(200)
    }

    pub fn not_found() -> Self {
        Self::json(serde_json::json!({"error": "Not Found"}), 404)
    }

    pub fn method_not_allowed() -> Self {
        Self::json(serde_json::json!({"error": "Method Not Allowed"}), 405)
    }

    pub fn internal_server_error() -> Self {
        Self::json(serde_json::json!({"error": "Internal Server Error"}), 500)
    }

    pub fn json<T: serde::Serialize>(data: T, status: u16) -> Self {
        let body = serde_json::to_vec(&data).unwrap_or_default();
        Self {
            status,
            body,
            headers: vec![("Content-Type".to_string(), "application/json".to_string())],
        }
    }

    pub fn send(self, out: ResponseOutparam) {
        let headers = Fields::new();
        for (k, v) in self.headers {
            let _ = headers.append(&k, &v.into_bytes());
        }

        let response = OutgoingResponse::new(headers);
        response.set_status_code(self.status as StatusCode).unwrap();

        let body = response.body().unwrap();

        ResponseOutparam::set(out, Ok(response));

        let stream = body.write().unwrap();
        let _ = stream.blocking_write_and_flush(&self.body);
        drop(stream);

        let _ = OutgoingBody::finish(body, None);
    }
}
