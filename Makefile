REPO=oklischat

GITTAG=$(shell git describe --tags --always $$(git log --format=format:%H -1 -- cpuburn.go go.mod Dockerfile))

build:
	go build

docker-build:
	docker build -t $(REPO)/cpuburn:$(GITTAG) .

docker-run: docker-build
	docker run --rm -p 8080:8080 --name cpuburn $(REPO)/cpuburn:$(GITTAG)

docker-push: docker-build
	docker push $(REPO)/cpuburn:$(GITTAG)
