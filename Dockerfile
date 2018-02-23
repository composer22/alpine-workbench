FROM alpine:latest
RUN apk upgrade --update \
  && apk --update-cache update \
  && apk add --update bash curl m4 \
  && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh docker-entrypoint.sh
CMD []
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
