FROM golang:alpine AS multistage

WORKDIR /go/src/app

COPY . .

RUN go mod init

RUN go build

RUN rm Dockerfile hello.go go.mod

##

FROM scratch
COPY --from=multistage /go/src/app/app /
CMD ["/app"]