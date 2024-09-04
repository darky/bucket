import gleam/http.{type Scheme}
import gleam/http/response.{type Response}
import gleam/option.{type Option}

pub type BucketError {
  InvalidXmlSyntaxError(String)
  UnexpectedXmlFormatError(String)
  UnexpectedResponseError(Response(BitArray))
  S3Error(http_status: Int, error: ErrorObject)
}

/// An error from S3.
pub type ErrorObject {
  ErrorObject(
    code: String,
    message: String,
    resource: String,
    request_id: String,
  )
}

/// The creds used to connect to an S3 API.
pub type Credentials {
  Credentials(
    scheme: Scheme,
    port: Option(Int),
    host: String,
    region: String,
    access_key_id: String,
    secret_access_key: String,
  )
}

pub fn credentials(
  host: String,
  access_key_id: String,
  secret_access_key: String,
) -> Credentials {
  Credentials(
    host:,
    access_key_id:,
    secret_access_key:,
    region: "eu-west-1",
    port: option.None,
    scheme: http.Https,
  )
}

/// Set the region for the credentials.
pub fn with_region(creds: Credentials, region: String) -> Credentials {
  Credentials(..creds, region:)
}

/// Set the port for the credentials.
pub fn with_port(creds: Credentials, port: Int) -> Credentials {
  Credentials(..creds, port: option.Some(port))
}

/// Set the scheme for the credentials. You should use HTTPS unless not possible.
pub fn with_scheme(creds: Credentials, scheme: http.Scheme) -> Credentials {
  Credentials(..creds, scheme:)
}

pub type Bucket {
  Bucket(name: String, creation_date: String)
}
