FROM golang:1.20 AS build
WORKDIR /app
COPY . /app

RUN go build -ldflags '-s -w' -o api main.go

FROM scratch
WORKDIR /app
COPY --from=build /app/api ./

CMD [ "./api" ]