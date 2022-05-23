FROM alpine:3.11.5

ARG APP_NAME
ARG MIX_ENV

RUN apk update && \
    apk add --no-cache \
      bash \
      openssl-dev

ENV REPLACE_OS_VARS=true \
    MIX_ENV=${MIX_ENV} \
    APP_NAME=${APP_NAME}

WORKDIR /opt/app

ADD ./_build/prod/rel/moon/ ./


CMD /opt/app/bin/${APP_NAME} start
  