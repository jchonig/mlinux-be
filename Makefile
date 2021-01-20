TAG=$(shell git branch --show-current)
IMAGE=mlinux-be

all: build

clean:
	find . -name \*~ -delete

# Run the container with just a bash shell
run-bash:
	docker run ${VOLUMES} -it --entrypoint /bin/bash ${IMAGE}:${TAG}

build: true
	docker build -t ${IMAGE}:${TAG} .

true: ;
