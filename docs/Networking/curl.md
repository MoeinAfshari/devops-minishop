# Curl

The curl command in Linux is a command-line tool used to transfer data between a system and a server using different network protocols. It is widely used for fetching web content, testing APIs, and sending or receiving data over the network.

## Curl Options

| Option | What It Does |
| :----: | :----------: |
| [URL]  | (No option) Prints URL content to stdout. |
| -o | filename Saves output to a one, custom filename. |
| -O | Saves output using the Original filename from the URL. |
| -C - | Continues/Resumes an interrupted download. |
| -X METHOD | Specifies the HTTP method (e.g., -X POST, -X DELETE). |
| -d "data" | Sends data in a POST or PUT request. |
| -H "Header" | Adds a custom HTTP Header (e.g., for JSON or auth tokens). |
| -L | Follows any server redirects (e.g., 301, 302). |
| -u user:pass | Provides user authentication credentials. |
| -T file.txt | Transfers (uploads) a local file to a destination. |
| -I | Fetches headers only (HTTP HEAD request). | 
|-i | Includes the HTTP response headers in the output. |
| -s | Silent mode (hides progress meter). |
| -# | Shows a simple progress bar. |

## Verbose Output Options

In the Output:
- Connection -> `Trying...` or `Connected to ...` indicates a TCP connection
- IP -> `IPv4:` or `IPv6:` like `Connected to geeksforgeeks.org (3.160.150.87)`
- Port -> `In the line Connected to geeksforgeeks.org (3.160.150.87) port 80`
- TLS -> `TLSv1.3` or `SSL connection using TLSv1.3`
- HTTP Status -> `The first response line, e.g., HTTP/1.1 301 Moved Permanently.`
- Request Header -> `Lines beginning with > (e.g., > GET / HTTP/1.1, > Host: ...).`
- Response Header -> `  Lines beginning with < (e.g., < Server: CloudFront, < Content-Type: text/html).`
