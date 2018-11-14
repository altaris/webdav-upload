FROM alpine:latest

MAINTAINER Cédric HT

RUN apk add --no-cache curl

ENV PATH /app:$PATH

COPY upload /app/

CMD upload