# check_http2

Nagios check_http plugin alternative.
Not implemented full feature, only we need.

## Usage

```text
Usage:
  check_http [OPTIONS]

Application Options:
      --timeout=                  Timeout to wait for connection (default: 10s)
      --max-buffer-size=          Max buffer size to read response body (default: 1MB)
      --no-discard                raise error when the response body is larger then max-buffer-size
      --consecutive=              number of consecutive successful requests required (default: 1)
      --interim=                  interval time after successful request for consecutive mode (default: 1s)
      --wait-for                  retry until successful when enabled
      --wait-for-interval=        retry interval (default: 2s)
      --wait-for-max=             time to wait for success
  -H, --hostname=                 Host name using Host headers
  -I, --IP-address=               IP address or Host name
  -p, --port=                     Port number
  -j, --method=                   Set HTTP Method (default: GET)
  -u, --uri=                      URI to request (default: /)
  -e, --expect=                   Comma-delimited list of expected HTTP response status
  -s, --string=                   String to expect in the content
      --base64-string=            Base64 Encoded string to expect the content
  -A, --useragent=                UserAgent to be sent (default: check_http)
  -a, --authorization=            username:password on sites with basic authentication
  -S, --ssl                       use https
      --sni                       enable SNI
      --tls-max=[1.0|1.1|1.2|1.3] maximum supported TLS version
  -4                              use tcp4 only
  -6                              use tcp6 only
  -V, --version                   Show version
  -v, --verbose                   Show verbose output
      --proxy=                    Proxy that should be used

Help Options:
  -h, --help                      Show this help message
```

example

check with HEAD request

```bash
% ./check_http2 -S  -I blog.nomadscafe.jp -H blog.nomadscafe.jp -u /2016/03/retty-tech-cafe-5.html -e 'HTTP/1.0 200,HTTP/1.1 200,HTTP/2.0 200' -j HEAD --sni
HTTP OK: Status line output "HTTP/2.0 200 OK" matched "HTTP/2.0 200"  - 482 bytes in 0.349 second response time | time=0.349428s;;;0.000000 size=482B;;;0
```

wait for success

```bash
% ./check_http2 -S -H blog.nomadscafe.jp -s kazeburo-wait-for --wait-for --wait-for-max 10s
2021/03/24 15:44:20 HTTP CRITICAL - HTTP response body Not matched "kazeburo-wait-for" from host on port 443
2021/03/24 15:44:22 HTTP CRITICAL - HTTP response body Not matched "kazeburo-wait-for" from host on port 443
2021/03/24 15:44:24 HTTP CRITICAL - HTTP response body Not matched "kazeburo-wait-for" from host on port 443
2021/03/24 15:44:27 HTTP CRITICAL - HTTP response body Not matched "kazeburo-wait-for" from host on port 443
2021/03/24 15:44:29 HTTP CRITICAL - HTTP response body Not matched "kazeburo-wait-for" from host on port 443
Give up waiting for success
```
