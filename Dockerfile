FROM golang:latest

WORKDIR /app
COPY . .
RUN make

CMD ["./whoami"]