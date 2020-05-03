FROM library/golang

# Godep for vendoring
RUN go get github.com/tools/godep

# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

ENV APP_DIR $GOPATH/src/github.com/chienyuan/beegoapp
RUN mkdir -p $APP_DIR

# Set the entrypoint
ENTRYPOINT (cd $APP_DIR && ./beegoapp)
ADD . $APP_DIR

# Compile the binary and statically link
RUN cd $APP_DIR && CGO_ENABLED=0 godep go build -ldflags '-d -w -s'
#RUn go get github.com/astaxie/beego
#RUN cd $APP_DIR && CGO_ENABLED=0 go build -ldflags '-d -w -s'
WORKDIR $APP_DIR
#CGO_ENABLED=0 GOOS=linux GOARCH=amd64  go build -a -tags netgo -ldflags '-w -extldflags "-static"'  -o beegoapp

EXPOSE 8080
