all: run-image | build-image

build-image: build-image/Dockerfile
	docker build -t zcash-build build-image

run-image: run-image/Dockerfile run-image/zcashd run-image/zcash-cli
	docker build -t zcash run-image

zcash:
	git checkout https://github.com/zcash/zcash.git zcash

zcash/src/zcashd: | zcash
	docker run -it --rm -u user -v $(CURDIR)/zcash:/home/user/zcash zcash-build bash -c 'cd ~/zcash && ./zcutil/build.sh -j9'

run-image/zcashd: zcash/src/zcashd
	cp zcash/src/zcashd run-image/zcashd

run-image/zcash-cli: zcash/src/zcashd
	cp zcash/src/zcash-cli run-image/zcash-cli

.PHONY: compile build-image run-image
