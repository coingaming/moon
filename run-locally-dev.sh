echo "Build assets"
cd assets
yarn
cd ..

echo "Install coingaming/sportsbet-design.git to steal work from there"
mkdir js_deps
cd js_deps 
git clone git@github.com:coingaming/sportsbet-design.git
cd sportsbet-design
yarn 
yarn build 
cd ../..


echo "Run server"
iex -S mix phx.server