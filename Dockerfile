# syntax=docker/dockerfile:1
FROM golang:1.18-alpine AS build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /src

RUN apk --no-cache add git
COPY *.go go.mod go.sum ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/prometheus-ecs-discovery .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build /bin/prometheus-ecs-discovery /bin/

# Add sample config in case its needed
COPY ./example/prometheus.yml /var/prom/prometheus.yml
ENTRYPOINT ["prometheus-ecs-discovery"]
