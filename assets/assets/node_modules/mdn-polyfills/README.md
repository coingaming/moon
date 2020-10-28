# Polyfills copy-pasted from MDN [![Build Status](https://travis-ci.org/msn0/mdn-polyfills.svg?branch=master)](http://travis-ci.org/msn0/mdn-polyfills) [![npm](https://img.shields.io/npm/dt/mdn-polyfills.svg)](https://www.npmjs.com/package/mdn-polyfills) ![dependencies](https://david-dm.org/msn0/mdn-polyfills.svg) [![](https://data.jsdelivr.com/v1/package/npm/mdn-polyfills/badge)](https://www.jsdelivr.com/package/npm/mdn-polyfills)

> [MDN](https://developer.mozilla.org) polyfills. A collection of side-effect ECMAScript modules. Minimized, mangled and extremely small thanks to [Rollup](https://rollupjs.org) - next-generation ES6 module bundler.

## Installation

```
npm i mdn-polyfills --save
```

## Usage

```js
import 'mdn-polyfills/POLYFILL_NAME';

// For example:

// (ES6 Modules)
import 'mdn-polyfills/Array.prototype.includes';
import 'mdn-polyfills/Object.create';

// (CommonJS)
require('mdn-polyfills/CustomEvent');
require('mdn-polyfills/String.prototype.padStart');

// and so on ...
```

Polyfills are also available over a CDN, for example

```html
<script src="https://unpkg.com/mdn-polyfills/Object.assign"></script>
<script src="https://cdn.jsdelivr.net/npm/mdn-polyfills/NodeList.prototype.forEach.js"></script>
```

## Supported polyfills

|name|size [b]|
|----|-------:|
|[Object.assign](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/assign#Polyfill)|274|
|[Object.create](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create#Polyfill)|299|
|[Object.entries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries)|151|
|[Object.keys](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)|723|
|[Object.values](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/values)|142|
|[Array.from](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/from?v=control#Polyfill)|788|
|[Array.of](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/of#Polyfill)|79|
|[Array.prototype.fill](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill#Polyfill)|343|
|[Array.prototype.filter](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/filter?v=control#Polyfill)|300|
|[Array.prototype.find](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/find?v=control#Polyfill)|330|
|[Array.prototype.findIndex](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex?v=control#Polyfill)|362|
|[Array.prototype.forEach](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach?v=control#Polyfill)|328|
|[Array.prototype.includes](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/includes?v=control#Polyfill)|346|
|[Array.prototype.some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some#Polyfill)|346|
|[Array.prototype.reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce#Polyfill)|492|
|[String.prototype.includes](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/String/includes#Polyfill)|153|
|[String.prototype.repeat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat#Polyfill)|504|
|[String.prototype.startsWith](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith#Polyfill)|117|
|[String.prototype.endsWith](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith#Polyfill)|148|
|[String.prototype.padStart](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart#Polyfill)|209|
|[String.prototype.padEnd](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd#Polyfill)|205|
|[String.prototype.trim](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim#Polyfill)|121|
|[Function.prototype.bind](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_objects/Function/bind#Polyfill)|427|
|[Node.prototype.addEventListener](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#Compatibility)|1321|
|[Node.prototype.append](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/append#Polyfill)|433|
|[Node.prototype.prepend](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/prepend#Polyfill)|452|
|[Node.prototype.before](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/before#Polyfill)|440|
|[Node.prototype.after](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/after#Polyfill)|461|
|[Node.prototype.remove](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/remove#Polyfill)|290|
|[Node.prototype.replaceWith](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/replaceWith#Polyfill)|731|
|[Node.prototype.children](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/children#Polyfill)|245|
|[Node.prototype.firstElementChild](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/firstElementChild#Polyfill_for_IE8_IE9_and_Safari)|262|
|[NodeList.prototype.forEach](https://developer.mozilla.org/en-US/docs/Web/API/NodeList/forEach#Polyfill)|158|
|[Element.prototype.closest](https://developer.mozilla.org/en-US/docs/Web/API/Element/closest#Polyfill)|333|
|[Element.prototype.toggleAttribute](https://developer.mozilla.org/en-US/docs/Web/API/Element/toggleAttribute#Polyfill)|243|
|[Element.prototype.matches](https://developer.mozilla.org/en-US/docs/Web/API/Element/matches#Polyfill)|133|
|[Element.prototype.classList](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList#Polyfill)|4450|
|[Element.prototype.getAttributeNames](https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttributeNames#Polyfill)|182|
|[MouseEvent](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent/MouseEvent#Polyfill)|405|
|[CustomEvent](https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/CustomEvent#Polyfill)|279|
|[Number.isInteger](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isInteger#Polyfill)|106|
|[Number.isNaN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isNaN#Polyfill)|53|
|[HTMLCanvasElement.prototype.toBlob](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/toBlob#Polyfill)|276|

# License

The mdn-polyfills as a module is licensed under MIT © [Michał Jezierski](https://github.com/msn0)<br/>
Polyfills are licensed under https://developer.mozilla.org/en-US/docs/MDN/About#Copyrights_and_licenses
