LDFLAGS=-ldflags "-w -s"

all: check_http2

.PHONY: check_http2

build: check_http2

check_http2: pkg/checkhttp/check.go cmd/check_http/main.go
	cd cmd/check_http && CGO_ENABLED=0 go build $(LDFLAGS) -o ../../check_http2 main.go

clean:
	rm -f check_http2

linux: main.go
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o check_http2 main.go

check:
	go test ./...

fmt:
	go fmt ./...

tag:
	git tag v${VERSION}
	git push origin v${VERSION}
	git push origin main
