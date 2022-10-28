swagger_version="4.14.2"

.PHONY: backend

all: backend

# Compile Backend
backend: pkg/generate/openapi.gen.go dist/openapi.yaml
	go get -v
	env GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-w -extldflags "-static"' -v -o backend

# Download the Swagger UI
dist:
	curl -L https://github.com/swagger-api/swagger-ui/archive/refs/tags/v$(swagger_version).tar.gz | tar zxv --strip-components=1 swagger-ui-$(swagger_version)/dist
	sed -i 's/https:\/\/petstore.swagger.io\/v2\/swagger.json/openapi.yaml/' dist/swagger-initializer.js

# Inject the OpenAPI docs into the Swagger UI
dist/openapi.yaml: dist openapi.yaml
	cp openapi.yaml dist/

# Generate the code from the OpenAPI docs
pkg/generate/openapi.gen.go: openapi.yaml oapi.yaml
	oapi-codegen -config oapi.yaml openapi.yaml
