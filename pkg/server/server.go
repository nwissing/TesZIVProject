// package server holds the web server implementation fulfilling the generated interface.
package server

import (
	"net/http"

	"github.com/labstack/echo/v4"

	"zivgitlab.uni-muenster.de/wwuit-sys/sddc/projectmanager/backend/pkg/generate"
)

// Server is the struct fulfilling the generated interface.
type Server struct{}

func (*Server) GetHealth(ctx echo.Context) error {
	return ctx.String(http.StatusOK, "OK")
}

func (s *Server) GetProject(ctx echo.Context, name generate.Name) error {
	return nil
}

func (s *Server) EnsureProject(ctx echo.Context, name generate.Name) error {
	return nil
}

func (s *Server) DeleteProject(ctx echo.Context, name generate.Name) error {
	return nil
}
