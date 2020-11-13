root_dir=`pwd`

rm lib/moon/assets/crests/*
rm lib/moon/assets/duotones/*
rm lib/moon/assets/icons/*
rm lib/moon/assets/logos/*
rm lib/moon/assets/patterns/*

cd scripts/typescript
yarn
npx ts-node assets-importer.ts

cd $root_dir
