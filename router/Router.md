# Router problem

## Question

I want to write a GitHub template for Go Web App with option to easy swap web routers (for example between Gin, Echo, Fiber, Chi, etc).
**But there is a problem** - *every framework has their own signature* handle function.

Framework | Signature
--------- | ---------
Gin | `func(c *gin.Context)`
Echo | `func(c echo.Context) error`
Chi | `func(w http.ResponseWriter, r *http.Request)`
Fiber | `func(c *fiber.Ctx) error`

I want to write intermediate layer between the service, *which uses the params from handler*, and handler, *that depends on the framework, which is chosen*. How do it better? Is it good idea?

Between **controller** and **service/use-cases**

![Clean architecure](./CleanArchitecture.jpg)

## Potential solution

Creating an intermediate layer that can easily swap between different web routers in a Go web app is a good idea, as it allows you to have a flexible and modular architecture. To accomplish this, you can follow these steps:

Define an interface for your custom router. This will serve as the intermediate layer between your web app and the different router implementations. For example:

```golang
package router

type Router interface {
    GET(path string, handler HandlerFunc)
    POST(path string, handler HandlerFunc)
    PUT(path string, handler HandlerFunc)
    DELETE(path string, handler HandlerFunc)
    PATCH(path string, handler HandlerFunc)
    Group(path string) Router
    Use(middleware ...MiddlewareFunc)
    Run(addr string) error
}

type HandlerFunc func(ctx *Context)
type MiddlewareFunc func(next HandlerFunc) HandlerFunc

type Context struct {
    Request     *http.Request
    Response    http.ResponseWriter
    Params      map[string]string
    QueryParams url.Values
}

```

Implement this interface for each web router you want to support (Gin, Echo, Fiber, Chi, etc.)

### Gin

Here's an example of how you might implement it for Gin:

```golang
package ginrouter

import (
    "net/http"
    "github.com/gin-gonic/gin"
    "github.com/yourusername/yourproject/router"
)

type GinRouter struct {
    engine *gin.Engine
}

func New() router.Router {
    return &GinRouter{
        engine: gin.Default(),
    }
}

func (r *GinRouter) GET(path string, handler router.HandlerFunc) {
    r.engine.GET(path, ginHandler(handler))
}

// Implement other methods for Router interface

func ginHandler(handler router.HandlerFunc) gin.HandlerFunc {
    return func(c *gin.Context) {
        ctx := &router.Context{
            Request:  c.Request,
            Response: c.Writer,
            Params:   make(map[string]string),
            QueryParams: c.Request.URL.Query(),
        }

        for _, p := range c.Params {
            ctx.Params[p.Key] = p.Value
        }

        handler(ctx)
    }
}
```

In your main application code, use your custom router interface to define routes and start the server. When you want to switch between router implementations, simply change the import statement and the router creation function:

```golang
package main

import (
    "github.com/{your username}/{your project}/router"
    "github.com/{your username}/{your project}/router/ginrouter" // Swap this import to change the router implementation
)

func main() {
    r := ginrouter.New() // Change this line to use a different router implementation

    r.GET("/", func(ctx *router.Context) {
        ctx.Response.Write([]byte("Hello, World!"))
    })

    r.Run(":8080")
}
```

### Echo

```golang
package echorouter

import (
    "net/http"
    "github.com/labstack/echo/v4"
    "github.com/yourusername/yourproject/router"
)

type EchoRouter struct {
    engine *echo.Echo
}

func New() router.Router {
    return &EchoRouter{
        engine: echo.New(),
    }
}

func (r *EchoRouter) GET(path string, handler router.HandlerFunc) {
    r.engine.GET(path, echoHandler(handler))
}

// Implement other methods for Router interface

func echoHandler(handler router.HandlerFunc) echo.HandlerFunc {
    return func(c echo.Context) error {
        ctx := &router.Context{
            Request:     c.Request(),
            Response:    c.Response(),
            Params:      make(map[string]string),
            QueryParams: c.QueryParams(),
        }

        for _, p := range c.ParamNames() {
            ctx.Params[p] = c.Param(p)
        }

        handler(ctx)
        return nil
    }
}
```

### Chi

```golang
package chirouter

import (
    "net/http"
    "github.com/go-chi/chi/v5"
    "github.com/go-chi/chi/v5/middleware"
    "github.com/yourusername/yourproject/router"
)

type ChiRouter struct {
    engine *chi.Mux
}

func New() router.Router {
    mux := chi.NewMux()
    mux.Use(middleware.Logger)
    mux.Use(middleware.Recoverer)

    return &ChiRouter{
        engine: mux,
    }
}

func (r *ChiRouter) GET(path string, handler router.HandlerFunc) {
    r.engine.Get(path, chiHandler(handler))
}

// Implement other methods for Router interface

func chiHandler(handler router.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        ctx := &router.Context{
            Request:     r,
            Response:    w,
            Params:      make(map[string]string),
            QueryParams: r.URL.Query(),
        }

        for k, v := range chi.RouteContext(r.Context()).URLParams {
            ctx.Params[k] = v
        }

        handler(ctx)
    }
}
```

### Fiber

```golang
package fiberrouter

import (
    "net/http"
    "github.com/gofiber/fiber/v2"
    "github.com/yourusername/yourproject/router"
)

type FiberRouter struct {
    engine *fiber.App
}

func New() router.Router {
    return &FiberRouter{
        engine: fiber.New(),
    }
}

func (r *FiberRouter) GET(path string, handler router.HandlerFunc) {
    r.engine.Get(path, fiberHandler(handler))
}

// Implement other methods for Router interface

func fiberHandler(handler router.HandlerFunc) fiber.Handler {
    return func(c *fiber.Ctx) error {
        ctx := &router.Context{
            Request:     c.Request(),
            Response:    c.Response(),
            Params:      make(map[string]string),
            QueryParams: c.Request().URL.Query(),
        }

        for k, v := range c.Route().Params {
            ctx.Params[k] = c.Params(v)
        }

        handler(ctx)
        return nil
    }
}
```

## Conclusion of this solution

By following these steps, you can create an intermediate layer that allows you to easily swap between different web routers in your Go web app.
This will enable you to have a modular and flexible architecture that supports multiple web routers.
Now, you can use any of these router implementations in your main application code by simply changing the import statement and the router creation function.
