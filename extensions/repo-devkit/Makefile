UBINDIR ?= /usr/bin
DESTDIR ?=
EXTNAME := $(shell basename $(shell pwd))
GOLANG_VERSION=$(shell go env GOVERSION)

# go tool nm ./luet | grep Commit
override LDFLAGS += -X "github.com/geaaru/luet/pkg/config.BuildTime=$(shell date -u '+%Y-%m-%d %I:%M:%S %Z')"
override LDFLAGS += -X "github.com/geaaru/luet/pkg/config.BuildCommit=$(shell git rev-parse HEAD)"
override LDFLAGS += -X "github.com/geaaru/luet/pkg/config.BuildGoVersion=$(GOLANG_VERSION)"

all: build install

build:
	CGO_ENABLED=0 go build -o luet-repo-devkit -ldflags '$(LDFLAGS)' luet-repo-devkit.go

install: build
	install -d $(DESTDIR)/$(UBINDIR)
	install -m 0755 luet-$(EXTNAME) $(DESTDIR)/$(UBINDIR)/
