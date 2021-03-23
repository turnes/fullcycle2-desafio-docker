FROM golang:alpine as build

WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go install -ldflags="-s -w" -v ./...

#FROM gcr.io/distroless/base
FROM scratch
COPY --from=build /go/bin/fullcycle2-desafio-docker-go /

CMD ["/fullcycle2-desafio-docker-go"]
