root_dir=`pwd`

mix phx.digest.clean --all

cd $root_dir/scripts/typescript/

yarn
cd node_modules
git clone git@github.com:coingaming/moon-design.git
cd moon-design
git reset --hard HEAD
git pull
npm install -g pnpm
pnpm install
pnpm run build


cd $root_dir/scripts/typescript/
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/currencies -o ./node_modules/moon-design/packages/assets/raw/currencies
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/duotones -o ./node_modules/moon-design/packages/assets/raw/duotones
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/logos -o ./node_modules/moon-design/packages/assets/raw/logos
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/patterns -o ./node_modules/moon-design/packages/assets/raw/patterns
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/crests -o ./node_modules/moon-design/packages/assets/raw/crests
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/icons/raw/imported/ -o ./node_modules/moon-design/packages/icons/raw/imported/


cd $root_dir
rm -rf lib/moon/assets
mkdir -p lib/moon/assets/crests
mkdir -p lib/moon/assets/currencies
mkdir -p lib/moon/assets/duotones
mkdir -p lib/moon/assets/icons
mkdir -p lib/moon/assets/logos
mkdir -p lib/moon/assets/patterns
rm -rf lib/moon/icons
mkdir -p lib/moon/icons
rm -rf assets/static/svgs
mkdir -p assets/static/svgs/crests
mkdir -p assets/static/svgs/currencies
mkdir -p assets/static/svgs/duotones
mkdir -p assets/static/svgs/icons
mkdir -p assets/static/svgs/icons_new
mkdir -p assets/static/svgs/logos
mkdir -p assets/static/svgs/patterns


cd $root_dir/scripts/typescript/
npx ts-node generate-svg-symbols.ts
npx ts-node assets-importer-legacy.ts
# npx ts-node icons-importer.ts
# npx ts-node icons-old-importer.ts
npx ts-node icons-importer-revised.ts
mv node_modules/moon-design moon-design
npx ts-node theme-importer.ts
mv moon-design node_modules/moon-design
npx ts-node figma-importer.ts
cd $root_dir


bash run-formatters.sh
mix phx.digest
