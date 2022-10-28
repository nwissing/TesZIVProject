# Build container
FROM golang:1.19 AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY openapi.yaml oapi.yaml Makefile main.go ./
COPY pkg pkg
RUN apt-get install -y make curl
RUN make backend

# Deployment Container
FROM gcr.io/distroless/base-debian11 as backend
WORKDIR /

COPY --from=build /app/backend /backend

USER nonroot:nonroot

ENTRYPOINT ["/backend"]
