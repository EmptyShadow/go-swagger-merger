FROM golang:1.16-alpine AS builder
ENV CGO_ENABLED 0
WORKDIR /app
COPY . .
RUN go build -mod=vendor -o /go-swagger-merger .

FROM scratch
COPY --from=builder /go-swagger-merger  /go-swagger-merger 
ENTRYPOINT ["/go-swagger-merger"]
