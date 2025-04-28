FROM alpine:3.18.2@sha256:bd649691cf299c58fec56fb84a5067a915da6915897c6f846a6e317e5ff42a4d

RUN apk upgrade --no-cache && \
    apk add --no-cache postgresql-client=15.3-r0 openssl=3.1.2-r0 libgcc=12.2.1_git20220924-r10 libstdc++=12.2.1_git20220924-r10 ncurses-libs=6.4_p20230506-r0 tini

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /opt/app

COPY --chown=appuser:appgroup _build ./_build

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:4000/health || exit 1

CMD ["tini", "--", "_build/prod/rel/moon/bin/moon", "start"]