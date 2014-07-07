VERSION=3.0.4
FILENAME=seafile-server_$(VERSION)_x86-64.tar.gz
URL=https://bitbucket.org/haiwen/seafile/downloads/$(FILENAME)
build: source
	docker build -t x3tech/seafile .

source: $(FILENAME)

$(FILENAME):
	wget $(URL)

clean:
	rm -rfv seafile-server{_,-}*
