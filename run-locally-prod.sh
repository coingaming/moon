rm -rf _build

export MIX_ENV=prod
export SERVICE_PORT=5000

rm -rf priv/static/
npm run deploy --prefix ./assets
cp -a priv/svgs priv/static/
mix phx.digest

mix distillery.release
_build/prod/rel/moon/bin/moon foreground
