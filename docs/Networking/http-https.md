# HTTP and HTTPS

## HTTP

HTTP (Hypertext Transfer Protocol) is a core Internet protocol that defines how data is exchanged between clients and severs on the web.

### HTTP Request and Response Components

| Concept | Description |
| :-----: | :---------: |
| HTTP Request Headers | Key-value pairs sent with the request that provide client details, preferences and request metadata. |
| HTTP Request Body | Contains data sent to the server, such as form data, credentials, or payload content. |
| HTTP Response | Server’s reply to a request, including status code, headers, and an optional body. |
| HTTP Status Codes | Three-digit codes indicating request results (1xx informational, 2xx success, 3xx redirection, 4xx client error, 5xx server error). |
| HTTP Response Headers | Metadata describing the response, such as content type, language, and encoding. |
| HTTP Response Body | Actual content returned by the server, such as HTML, JSON, images, or other data. |

### Methods of HTTP

HTTP methods define the type of action a client wants to perform on a resource hosted by a server.

- GET: Retrieves data without modifying the resource.
- POST: Submits data for processing or resource creation.
- PUT: Creates or replaces a resource completely.
- PATCH: Partially updates a resource.
- DELETE: Removes a resource from the server.
- HEAD: Retrieves response headers only.
- OPTIONS: Returns supported methods and communication options.
- TRACE: Echoes the request for debugging (rarely used due to security resks).
- CONNECT: Establishes a tunnel, typically for HTTPS via proxies.

### Most Important Status Codes

```bash
200 OK
201 Created
301 Moved Permanently
302 Found
400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
500 Internal Server Error
502 Bad Gateway
503 Service Unavailable
```

## HTTPS

HTTPS is HTTP mainly that has secure communication with using TLS.

### HTTP vs HTTPS

| Feature | HTTP | HTTPS |
| :-----: | :--: | :---: |
| Security | Data is sent as plain text — easy to intercept. | Data is encrypted — safer from hackers. |
| Port | Uses port 80 by default. | Uses port 443 by default. |
| Trust | Browsers may label it “Not Secure.” | Shows a padlock in the address bar. |
| Speed | Slightly slower on old systems.       | Often faster due to newer protocols and optimizations. |
| Use case | Suitable for public or non-sensitive info. | Best for sensitive data like payments, logins, personal info. |

