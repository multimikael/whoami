FROM golang:latest

WORKDIR /whoami
COPY . .
RUN go build -v

CMD ["./whoami"]
