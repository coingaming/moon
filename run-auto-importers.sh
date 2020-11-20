root_dir=`pwd`

cd assets/
rm -rf node_modules/moon-css 
npm i 
cd $root_dir

rm lib/moon/assets/crests/*
rm lib/moon/assets/duotones/*
rm lib/moon/assets/icons/*
rm lib/moon/assets/logos/*
rm lib/moon/assets/patterns/*

cd scripts/typescript
yarn
npx ts-node assets-importer.ts
cd $root_dir

rm -rf assets/static/svgs
cp -a assets/node_modules/moon-css/example/assets assets/static/svgs

mix phx.digest
