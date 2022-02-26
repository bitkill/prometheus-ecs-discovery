# syntax=docker/dockerfile:1
FROM golang:1.17-alpine AS build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /src

RUN apk --no-cache add git
COPY *.go go.mod go.sum ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/prometheus-ecs-discovery .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /bin/prometheus-ecs-discovery /bin/
ENTRYPOINT ["prometheus-ecs-discovery"]
