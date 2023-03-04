VERSION ?= $(shell git rev-parse HEAD | head -c 8)
build-image:
	docker build -t chenmhgo/gosrc:$(VERSION) .

rm-image:
	docker rmi chenmhgo/gosrc:$(VERSION)

push-image:
	docker push chenmhgo/gosrc:$(VERSION)

run-image:
	docker run -d -p 8000:8000 chenmhgo/gosrc:$(VERSION)

