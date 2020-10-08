bash run-install.sh
rm -rf _build

echo "\nRun server"
iex -S mix phx.server
