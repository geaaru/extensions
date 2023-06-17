BUNDLED_EXTENSIONS ?= k8s-build-scheduler remote-exec autobump-github geniso genimage qa-artefacts package-browser parallel-tools portage apkbuildconverter repo-devkit
BUNDLED_EXTENSIONS_TEST ?= autobump-github
UBINDIR ?= /usr/bin
DESTDIR ?=

all: build

build:
	for d in $(BUNDLED_EXTENSIONS); do $(MAKE) -C extensions/$$d build; done

install: build
	for d in $(BUNDLED_EXTENSIONS); do $(MAKE) -C extensions/$$d install; done

install_luet:
	curl https://raw.githubusercontent.com/geaaru/luet/geaaru/contrib/config/get_luet_root.sh | sh

test:
	for d in $(BUNDLED_EXTENSIONS_TEST); do $(MAKE) -C extensions/$$d test; done
