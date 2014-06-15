filename = "baikal-regular-0.2.7.tgz"
url = "http://baikal-server.com/get/$(filename)"

all: build

download:
	[ -e "$(filename)" ] || wget "$(url)"

build: download
	docker build --rm --no-cache -t x3tech/baikal .
