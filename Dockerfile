FROM golang:1.20 AS builder

WORKDIR /usr/src/myproject

COPY . .
RUN make build


FROM alpine:3

LABEL description="cpuburn container image"

MAINTAINER Olaf Klischat <olaf.klischat@gmail.com>

COPY --from=builder /usr/src/myproject/cpuburn /usr/local/bin/cpuburn

ENTRYPOINT /usr/local/bin/cpuburn
