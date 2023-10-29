module github.com/sni/check_http_go

go 1.21

replace pkg/checkhttp => ./pkg/checkhttp

require (
    pkg/checkhttp v0.0.0-00010101000000-000000000000
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/jessevdk/go-flags v1.5.0 // indirect
	golang.org/x/sys v0.12.0 // indirect
)
