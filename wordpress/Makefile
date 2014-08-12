VERSION=3.9.2
FILENAME=wordpress-$(VERSION).tar.gz
URL=http://wordpress.org/$(FILENAME)

build: source build/envtpl
	docker build -t x3tech/wordpress .

build/envtpl:
	[ -d build ] || mkdir build
	GOPATH=$(PWD)/build go get github.com/3onyc/envtpl
	GOPATH=$(PWD)/build go install github.com/3onyc/envtpl

source: $(FILENAME)

$(FILENAME):
	wget $(URL)

clean:
	rm -rfv worpdress-*.tar.gz

.PHONY: build
