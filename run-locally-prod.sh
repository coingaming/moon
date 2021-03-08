rm -rf _build

export MIX_ENV=prod
export SERVICE_PORT=5000

npm run deploy --prefix ./assets
mix phx.digest

mix distillery.release
_build/prod/rel/moon/bin/moon foreground
