FROM golang:1.11.5

WORKDIR /go/src/app
COPY src/* .
COPY credentials.json .

RUN go get github.com/gorilla/mux
RUN go get -u google.golang.org/api/sheets/v4
RUN go get -u golang.org/x/oauth2/google

RUN go build

RUN ls -al
RUN cat credentials.json

EXPOSE 8000

CMD ["./app"]