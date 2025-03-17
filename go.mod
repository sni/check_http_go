module github.com/sni/check_http_go

go 1.21

replace pkg/checkhttp => ./pkg/checkhttp

require pkg/checkhttp v0.0.0-00010101000000-000000000000

require (
	github.com/dustin/go-humanize v1.0.1 // indirect
	github.com/sni/go-flags v0.0.0-20240724130408-1ec865bcf4f3 // indirect
	golang.org/x/sys v0.21.0 // indirect
)
