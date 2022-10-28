package main

import (
	"embed"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"

	"zivgitlab.uni-muenster.de/wwuit-sys/sddc/projectmanager/backend/pkg/generate"
	"zivgitlab.uni-muenster.de/wwuit-sys/sddc/projectmanager/backend/pkg/server"
)


var ui embed.FS

func main() {
	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Register the handles
	generate.RegisterHandlers(e, &server.Server{})

	// Serve UI
	e.StaticFS("/ui", echo.MustSubFS(ui, "dist"))
	e.Logger.Fatal((e.Start(":8080")))
}
