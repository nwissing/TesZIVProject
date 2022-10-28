# Backend

This is the backend of the [Project Manager](https://zivgitlab.uni-muenster.de/wwuit-sys/sddc/projectmanager).

It is mostly based on

* [OpenAPI Specification](https://swagger.io/specification/): An industry standard for RESTful API design
* [oapi-codegen](https://github.com/deepmap/oapi-codegen): OpenAPI Client and Server Code Generator
* [Echo](https://echo.labstack.com/): High performance, extensible, minimalist Go web framework

## Development

Prerequisites to build the software are

* [Go](https://go.dev/doc/install)
* [oapi-codegen](https://github.com/deepmap/oapi-codegen)
* `make`


To build the software itself, run `make`.
For more details, take a look at the [Makefile](./Makefile)

After starting the server with `./backend`, you can browse the API under [http://localhost:8080/ui](http://localhost:8080/ui).
