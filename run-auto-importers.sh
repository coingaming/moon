root_dir=`pwd`

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
yarn
cd node_modules
git clone git@github.com:coingaming/assets.git
cd assets
git reset --hard HEAD
git pull
npm install -g pnpm
pnpm install
cp $root_dir/.env .env
pnpm run build
export page=$(grep ICON_PAGE_NAME .env | cut -d '=' -f2)
npm run figma --page=$page

cd $root_dir/scripts/typescript/
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/currencies -o ./node_modules/moon-design/packages/assets/raw/currencies
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/duotones -o ./node_modules/moon-design/packages/assets/raw/duotones
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/logos -o ./node_modules/moon-design/packages/assets/raw/logos
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/patterns -o ./node_modules/moon-design/packages/assets/raw/patterns
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/assets/raw/crests -o ./node_modules/moon-design/packages/assets/raw/crests
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/moon-design/packages/icons/raw/imported/ -o ./node_modules/moon-design/packages/icons/raw/imported/
./node_modules/svgo/bin/svgo --config=./svgo.config.js -f ./node_modules/assets/svg/$page/ -o ./node_modules/assets/svg/$page/


cd $root_dir
rm -rf lib/moon/assets/crests lib/moon/assets/currencies lib/moon/assets/duotones lib/moon/assets/icons lib/moon/assets/logos lib/moon/assets/patterns
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
cp $root_dir/.env $root_dir/scripts/typescript/.env
npx ts-node generate-svg-symbols.ts
npx ts-node assets-importer-legacy.ts
npx ts-node icons-importer.ts
mv node_modules/moon-design moon-design
npx ts-node theme-importer.ts
mv moon-design node_modules/moon-design
npx ts-node figma-importer.ts
cd $root_dir
rm $root_dir/scripts/typescript/.env

bash run-formatters.sh
# mix phx.digest
