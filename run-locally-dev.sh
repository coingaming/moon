# echo "\n# Build assets"
# cd assets
# yarn
# cd ..
# echo "Success."

# echo "\n# Install coingaming/sportsbet-design.git to steal work from there"
# mkdir js_deps
# cd js_deps 
# git clone git@github.com:coingaming/sportsbet-design.git
# cd sportsbet-design
# yarn 
# yarn build 
# cd ../..
# echo "Success."

# echo "\n# Steal work from coingaming/sportsbet-design.git"
# echo "* svgs"
# mkdir -p assets/svgs
# cp -a js_deps/sportsbet-design/packages/assets/raw/* assets/svgs
# echo "* themes"
cd scripts/theme_importer
npx ts-node index.ts
cd ../..
echo "Success."

# echo "\nRun server"
# iex -S mix phx.server