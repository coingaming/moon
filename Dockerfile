# ---- Build stage ----
FROM heathmont/elixir-ci:1.15.6-otp-26-alpine AS build

ARG MIX_ENV=prod
ARG APP_NAME=moon
ARG APP_VSN

ENV MIX_ENV=${MIX_ENV} \
    APP_NAME=${APP_NAME} \
    APP_VSN=${APP_VSN}

WORKDIR /app

RUN apk add --no-cache \
    openssh \
    inotify-tools

COPY mix.exs mix.lock ./
COPY config config

RUN curl -fsSL https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only ${MIX_ENV}

COPY . .

RUN mix deps.compile && \
    npm install --prefix ./assets && \
    npm run deploy --prefix ./assets && \
    mix phx.digest && \
    mix release

# ---- Runtime stage ----
FROM alpine:3.18.2 AS app

RUN apk upgrade --no-cache && \
    apk add --no-cache \
    erlang-dev \
    perl \
    postgresql-client \
    openssl \
    ncurses-libs \
    tini

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /opt/app
EXPOSE 4000

COPY _build ./_build

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:4000/health || exit 1

CMD ["tini", "--", "./bin/moon", "start"]
