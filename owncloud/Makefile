filename = "owncloud-6.0.3.tar.bz2"
url = "http://download.owncloud.org/community/$(filename)"

all: build

download:
	[ -e "$(filename)" ] || wget "$(url)"

build: download
	docker build --rm --no-cache -t x3tech/owncloud .
