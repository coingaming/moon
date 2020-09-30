import aposta10Dark from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark';
import aposta10Light from '../../js_deps/sportsbet-design/packages/themes/src/aposta10Light/aposta10Light';
import bitcasinoDark from '../../js_deps/sportsbet-design/packages/themes/src/bitcasinoDark/bitcasinoDark';
import bitcasinoLight from '../../js_deps/sportsbet-design/packages/themes/src/bitcasinoLight/bitcasinoLight';
import livecasinoDark from '../../js_deps/sportsbet-design/packages/themes/src/livecasinoDark/livecasinoDark';
import livecasinoLight from '../../js_deps/sportsbet-design/packages/themes/src/livecasinoLight/livecasinoLight';

import * as fs from 'fs';

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

const camelToSnakeCase = (str) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

function jsKeysToElixirKeys(obj) {
  let newObj = {};

  for (const k in obj) {
    newObj[camelToSnakeCase(k)] =
      typeof obj[k] == 'object' ? jsKeysToElixirKeys(obj[k]) : obj[k];
  }

  return newObj;
}

const toCamel = (s) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1.toUpperCase().replace('-', '').replace('_', '');
  });
};

const toCapitalisedCamel = (s) => capitalizeFirstLetter(toCamel(s))

function toTree(obj) {
  let tree = [];

  for (const k in obj) {
    if (typeof obj[k] == 'object') {
      tree.push([k, toTree(obj[k])]);
    } else {
      tree.push([k, obj[k]]);
    }
  }

  return tree;
}

function toElixirStructs(
  tree,
  rootModule = 'Moon.Sites.Aposta10.Themes.Light',
  currentModule = ''
) {
  let currentStruct = [];
  let childrenStructs = [];

  tree.forEach(([k, v]) => {
    if (typeof v == 'object') {
      currentStruct.push([k, `%${rootModule}.${toCapitalisedCamel(k)}{}`]);
      childrenStructs.push(toElixirStructs(v, `${rootModule}.${toCapitalisedCamel(k)}`));
    } else {
      currentStruct.push([k, JSON.stringify(v)]);
    }
  });

  const elixirModule = currentStruct.map((x) => x.join(': ')).join(',\n    ');

  return `
defmodule ${rootModule}${currentModule} do
  defstruct ${elixirModule}
end

${childrenStructs.join('')}
`;
}

function writeTheme(jsTheme, exThemePath) {
  const exObj = jsKeysToElixirKeys(jsTheme);
  const tree = toTree(exObj);

  fs.writeFileSync(exThemePath, toElixirStructs(tree));
}

writeTheme(aposta10Dark, '../../lib/moon/sites/aposta10/themes/dark.ex');
