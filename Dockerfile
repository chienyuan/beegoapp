FROM golang:1.14-alpine AS build

# Install tools required for beegoapp
# Run `docker build --no-cache .` to update dependencies
RUN apk add --no-cache git

# List beegoapp dependencies with Gopkg.toml and Gopkg.lock
# These layers are only re-built when Gopkg files are updated
WORKDIR /go/src/beegoapp/

# Copy the entire beegoapp and build it
# This layer is rebuilt when a file changes in the beegoapp directory
COPY . /go/src/beegoapp/
RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o beegoapp

# This results in a single layer image
FROM scratch
COPY --from=build /go/src/beegoapp/ /beegoapp/
WORKDIR /beegoapp
ENTRYPOINT ["/beegoapp/beegoapp"]
CMD ["--help"]

