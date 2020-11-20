export MIX_ENV=prod
export SERVICE_PORT=5000

mix distillery.release
_build/prod/rel/moon/bin/moon foreground
