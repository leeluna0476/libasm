.DEFAULT_GOAL=build

build:
	docker build -t alpine:amd64 --platform linux/amd64 .

run:
	@if docker ps -a | grep -q libasm; then \
		docker start -i libasm; \
	else \
		docker run --platform linux/amd64 --name libasm -v ./srcs:/root/srcs -it alpine:amd64; \
	fi
