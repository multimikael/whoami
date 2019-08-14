GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
BIN=whoami
ifndef GOPATH
	GOPATH=$(HOME)/go
endif

build:
	$(GOBUILD) -v

build-all: 
	$(MAKE) GOOS=darwin GOARCH=amd64 build-unix
	$(MAKE) GOOS=linux GOARCH=386 build-unix
	$(MAKE) GOOS=linux GOARCH=amd64 build-unix
	$(MAKE) GOOS=linux GOARCH=arm GOARM=5 build-armv
	$(MAKE) GOOS=linux GOARCH=arm GOARM=6 build-armv
	$(MAKE) GOOS=linux GOARCH=arm GOARM=7 build-armv
	$(MAKE) GOOS=linux GOARCH=arm64 build-unix
	$(MAKE) GOOS=windows GOARCH=386 build-windows
	$(MAKE) GOOS=windows GOARCH=amd64 build-windows

build-unix:
	$(GOBUILD) -o $(BIN)_$(GOOS)_$(GOARCH) -v

build-armv:
	$(GOBUILD) -o $(BIN)_$(GOOS)_$(GOARCH)v$(GOARM) -v

build-windows:
	$(GOBUILD) -o $(BIN)_$(GOOS)_$(GOARCH).exe -v

clean:
	rm -f $(BIN)_*

docker-build:
	docker run --rm -ti -v "$(GOPATH)":/go -w /go/src/github.com/multimikael/whoami golang:latest go build -v
