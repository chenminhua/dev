FROM golang:1.19-alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build -o app

FROM alpine:3.15

WORKDIR /app

COPY --from=builder /go/src/app/app .

EXPOSE 8000

ENTRYPOINT ["./app"]