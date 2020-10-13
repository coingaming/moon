root_dir=`pwd`

echo "# Install deps"
mix setup

echo "# Build assets"
cd assets
yarn
cd $root_dir

