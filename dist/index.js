// modules are defined as an array
// [ module function, map of requires ]
//
// map of requires is short require name -> numeric require
//
// anything defined in a previous bundle is accessed via the
// orig method which is the require for previous bundles
parcelRequire = (function (modules, cache, entry, globalName) {
  // Save the require from previous bundle to this closure if any
  var previousRequire = typeof parcelRequire === 'function' && parcelRequire;
  var nodeRequire = typeof require === 'function' && require;

  function newRequire(name, jumped) {
    if (!cache[name]) {
      if (!modules[name]) {
        // if we cannot find the module within our internal map or
        // cache jump to the current global require ie. the last bundle
        // that was added to the page.
        var currentRequire = typeof parcelRequire === 'function' && parcelRequire;
        if (!jumped && currentRequire) {
          return currentRequire(name, true);
        }

        // If there are other bundles on this page the require from the
        // previous one is saved to 'previousRequire'. Repeat this as
        // many times as there are bundles until the module is found or
        // we exhaust the require chain.
        if (previousRequire) {
          return previousRequire(name, true);
        }

        // Try the node require function if it exists.
        if (nodeRequire && typeof name === 'string') {
          return nodeRequire(name);
        }

        var err = new Error('Cannot find module \'' + name + '\'');
        err.code = 'MODULE_NOT_FOUND';
        throw err;
      }

      localRequire.resolve = resolve;
      localRequire.cache = {};

      var module = cache[name] = new newRequire.Module(name);

      modules[name][0].call(module.exports, localRequire, module, module.exports, this);
    }

    return cache[name].exports;

    function localRequire(x){
      return newRequire(localRequire.resolve(x));
    }

    function resolve(x){
      return modules[name][1][x] || x;
    }
  }

  function Module(moduleName) {
    this.id = moduleName;
    this.bundle = newRequire;
    this.exports = {};
  }

  newRequire.isParcelRequire = true;
  newRequire.Module = Module;
  newRequire.modules = modules;
  newRequire.cache = cache;
  newRequire.parent = previousRequire;
  newRequire.register = function (id, exports) {
    modules[id] = [function (require, module) {
      module.exports = exports;
    }, {}];
  };

  var error;
  for (var i = 0; i < entry.length; i++) {
    try {
      newRequire(entry[i]);
    } catch (e) {
      // Save first error but execute all entries
      if (!error) {
        error = e;
      }
    }
  }

  if (entry.length) {
    // Expose entry point to Node, AMD or browser globals
    // Based on https://github.com/ForbesLindesay/umd/blob/master/template.js
    var mainExports = newRequire(entry[entry.length - 1]);

    // CommonJS
    if (typeof exports === "object" && typeof module !== "undefined") {
      module.exports = mainExports;

    // RequireJS
    } else if (typeof define === "function" && define.amd) {
     define(function () {
       return mainExports;
     });

    // <script>
    } else if (globalName) {
      this[globalName] = mainExports;
    }
  }

  // Override the current require with this new one
  parcelRequire = newRequire;

  if (error) {
    // throw error from earlier, _after updating parcelRequire_
    throw error;
  }

  return newRequire;
})({"../../js_deps/sportsbet-design/node_modules/@heathmont/sportsbet-cdn/lib/index.js":[function(require,module,exports) {
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * cdnUrl
 *
 * The base path for CDN assets.
 *
 * Note: `cdnUrl` does **not** end with a trailing forward slash, you will need
 * to append this yourself when consuming assets.
 */
exports.cdnUrl = "https://sportsbet.io/sportsbet-io/files";

},{}],"../../js_deps/sportsbet-design/node_modules/@heathmont/moon-fonts/lib/es/avertaStd/avertaStd.js":[function(require,module,exports) {
"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = exports.avertaStd = void 0;

var _sportsbetCdn = require("@heathmont/sportsbet-cdn");

var fontDirPath = "".concat(_sportsbetCdn.cdnUrl, "/fonts/averta-std");
var fontFilePath = {
  regular: "".concat(fontDirPath, "/regular"),
  semibold: "".concat(fontDirPath, "/semibold")
};
var fontFamily = 'Averta Std';
var fontStack = "".concat(fontFamily, ", -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif");
var fontStyle = 'normal';
var fontDisplay = 'swap';
var fontWeight = {
  normal: 400,
  semibold: 500
};
var unicodeRange = 'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD';
var fontFace = [{
  '@font-face': {
    fontFamily: fontFamily,
    fontStyle: fontStyle,
    fontDisplay: fontDisplay,
    unicodeRange: unicodeRange,
    fontWeight: fontWeight.normal,
    src: "local(\"AvertaStd-Regular\"), local(\"Averta Std Regular\"), url(".concat(fontFilePath.regular, ".woff2) format(\"woff2\")")
  }
}, {
  '@font-face': {
    fontFamily: fontFamily,
    fontStyle: fontStyle,
    fontDisplay: fontDisplay,
    unicodeRange: unicodeRange,
    fontWeight: fontWeight.semibold,
    src: "local(\"AvertaStd-Semibold\"), local(\"Averta Std Semibold\"), url(".concat(fontFilePath.semibold, ".woff2) format(\"woff2\")")
  }
}];
var avertaStd = {
  fontDirPath: fontDirPath,
  fontFilePath: fontFilePath,
  fontFamily: fontFamily,
  fontStack: fontStack,
  fontStyle: fontStyle,
  fontWeight: fontWeight,
  fontFace: fontFace,
  unicodeRange: unicodeRange
};
exports.avertaStd = avertaStd;
var _default = avertaStd;
exports.default = _default;
},{"@heathmont/sportsbet-cdn":"../../js_deps/sportsbet-design/node_modules/@heathmont/sportsbet-cdn/lib/index.js"}],"../../js_deps/sportsbet-design/node_modules/@heathmont/moon-fonts/lib/es/index.js":[function(require,module,exports) {
"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
var _exportNames = {
  avertaStd: true
};
Object.defineProperty(exports, "avertaStd", {
  enumerable: true,
  get: function () {
    return _avertaStd.default;
  }
});

var _avertaStd = _interopRequireWildcard(require("./avertaStd/avertaStd"));

Object.keys(_avertaStd).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  if (Object.prototype.hasOwnProperty.call(_exportNames, key)) return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function () {
      return _avertaStd[key];
    }
  });
});

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function () { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }
},{"./avertaStd/avertaStd":"../../js_deps/sportsbet-design/node_modules/@heathmont/moon-fonts/lib/es/avertaStd/avertaStd.js"}],"../../js_deps/sportsbet-design/packages/themes/src/sharedTokens/sharedTokens.ts":[function(require,module,exports) {
"use strict";

exports.__esModule = true;
var borderStyle = 'solid';
var borderWidth = 1;
var space = 16;
var sharedTokens = {
  base: {
    space: space,
    fontSize: 16,
    lineHeight: 20
  },
  borderStyle: borderStyle,
  borderWidth: borderWidth,
  border: borderWidth + "px " + borderStyle,
  boxShadow: '0px 1.2px 3.6px rgba(0, 0, 0, 0.108), 0px 6.4px 14.4px rgba(0, 0, 0, 0.132)',
  breakpoint: {
    small: 500,
    medium: 800,
    large: 1080,
    xlarge: 1200
  },
  fontFace: undefined,
  fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif',
  fontSize: {
    body: 14
  },
  fontWeight: {
    normal: 400,
    semibold: 500
  },
  maxWidth: {
    "default": 1024,
    large: 1440
  },
  opacity: {
    disabled: 0.35
  },
  radius: {
    small: space * 0.25,
    "default": space * 0.5,
    largest: 100
  },
  space: {
    xsmall: space * 0.25,
    small: space * 0.5,
    "default": space,
    medium: space * 1.5,
    large: space * 2,
    xlarge: space * 2.5
  },
  transitionDuration: {
    slow: 0.4,
    "default": 0.2
  },
  zIndex: {
    carouselControl: 5,
    dialog: 10000,
    toggle: 1
  }
};
exports["default"] = sharedTokens;
},{}],"../../js_deps/sportsbet-design/packages/themes/src/supportColors/supportColors.ts":[function(require,module,exports) {
"use strict";

exports.__esModule = true;
var supportColors = {
  // Warning colors
  krillin: {
    100: '#FFB319',
    10: '#FFE4AD'
  },
  // Error colors
  chiChi: {
    100: '#FF4E64',
    10: '#FFA7B2'
  },
  // Success colors
  roshi: {
    100: '#0CD664',
    10: '#B6F3D0'
  },
  dodoria: {
    100: '#D33030',
    10: '#E99797'
  },
  cell: {
    100: '#0AB758',
    10: '#84DBAB'
  },
  raditz: {
    100: '#B3804A',
    10: '#D9BFA4'
  },
  whis: {
    100: '#0F75BD',
    10: '#87BADE'
  },
  frieza: {
    100: '#5C33CF',
    10: '#B6A3E9'
  },
  nappa: {
    100: '#725550',
    10: '#B8AAA7'
  }
};
exports["default"] = supportColors;
},{}],"../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark.ts":[function(require,module,exports) {
"use strict";

var __assign = this && this.__assign || function () {
  __assign = Object.assign || function (t) {
    for (var s, i = 1, n = arguments.length; i < n; i++) {
      s = arguments[i];

      for (var p in s) {
        if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
      }
    }

    return t;
  };

  return __assign.apply(this, arguments);
};

var __importDefault = this && this.__importDefault || function (mod) {
  return mod && mod.__esModule ? mod : {
    "default": mod
  };
};

exports.__esModule = true;

var moon_fonts_1 = require("@heathmont/moon-fonts");

var sharedTokens_1 = __importDefault(require("../sharedTokens/sharedTokens"));

var supportColors_1 = __importDefault(require("../supportColors/supportColors"));

var color = {
  piccolo: {
    120: '#2E9468',
    100: '#39A275',
    80: '#46AF81'
  },
  hit: {
    120: '#565e6c',
    100: '#636b79',
    80: '#6f7785'
  },
  goten: {
    100: '#FFFFFF'
  },
  goku: {
    100: '#070A0D',
    80: '#11161D',
    40: '#262F3B',
    10: '#3D4957'
  },
  gohan: {
    100: '#272C35',
    80: '#323843',
    40: '#4A515E',
    10: '#636B79'
  },
  beerus: {
    100: '#4E535A'
  },
  bulma: {
    100: '#FFFFFF'
  },
  trunks: {
    100: '#C8D0D5'
  }
};

var aposta10Dark = __assign({}, sharedTokens_1["default"], {
  brand: 'Aposta10',
  fontFace: moon_fonts_1.avertaStd.fontFace,
  fontFamily: moon_fonts_1.avertaStd.fontStack,
  fontSize: {
    body: 14
  },
  color: __assign({
    text: color.bulma[100],
    background: color.goku[100]
  }, supportColors_1["default"], color),
  colorScheme: 'dark'
});

exports["default"] = aposta10Dark;
},{"@heathmont/moon-fonts":"../../js_deps/sportsbet-design/node_modules/@heathmont/moon-fonts/lib/es/index.js","../sharedTokens/sharedTokens":"../../js_deps/sportsbet-design/packages/themes/src/sharedTokens/sharedTokens.ts","../supportColors/supportColors":"../../js_deps/sportsbet-design/packages/themes/src/supportColors/supportColors.ts"}],"index.ts":[function(require,module,exports) {
"use strict";

var __importDefault = this && this.__importDefault || function (mod) {
  return mod && mod.__esModule ? mod : {
    "default": mod
  };
};

Object.defineProperty(exports, "__esModule", {
  value: true
});

var aposta10Dark_1 = __importDefault(require("../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark"));

console.log(aposta10Dark_1.default);
},{"../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark":"../../js_deps/sportsbet-design/packages/themes/src/aposta10Dark/aposta10Dark.ts"}],"../../../../Users/marguspart/.config/yarn/global/node_modules/parcel-bundler/src/builtins/hmr-runtime.js":[function(require,module,exports) {
var global = arguments[3];
var OVERLAY_ID = '__parcel__error__overlay__';
var OldModule = module.bundle.Module;

function Module(moduleName) {
  OldModule.call(this, moduleName);
  this.hot = {
    data: module.bundle.hotData,
    _acceptCallbacks: [],
    _disposeCallbacks: [],
    accept: function (fn) {
      this._acceptCallbacks.push(fn || function () {});
    },
    dispose: function (fn) {
      this._disposeCallbacks.push(fn);
    }
  };
  module.bundle.hotData = null;
}

module.bundle.Module = Module;
var checkedAssets, assetsToAccept;
var parent = module.bundle.parent;

if ((!parent || !parent.isParcelRequire) && typeof WebSocket !== 'undefined') {
  var hostname = "" || location.hostname;
  var protocol = location.protocol === 'https:' ? 'wss' : 'ws';
  var ws = new WebSocket(protocol + '://' + hostname + ':' + "53086" + '/');

  ws.onmessage = function (event) {
    checkedAssets = {};
    assetsToAccept = [];
    var data = JSON.parse(event.data);

    if (data.type === 'update') {
      var handled = false;
      data.assets.forEach(function (asset) {
        if (!asset.isNew) {
          var didAccept = hmrAcceptCheck(global.parcelRequire, asset.id);

          if (didAccept) {
            handled = true;
          }
        }
      }); // Enable HMR for CSS by default.

      handled = handled || data.assets.every(function (asset) {
        return asset.type === 'css' && asset.generated.js;
      });

      if (handled) {
        console.clear();
        data.assets.forEach(function (asset) {
          hmrApply(global.parcelRequire, asset);
        });
        assetsToAccept.forEach(function (v) {
          hmrAcceptRun(v[0], v[1]);
        });
      } else if (location.reload) {
        // `location` global exists in a web worker context but lacks `.reload()` function.
        location.reload();
      }
    }

    if (data.type === 'reload') {
      ws.close();

      ws.onclose = function () {
        location.reload();
      };
    }

    if (data.type === 'error-resolved') {
      console.log('[parcel] ✨ Error resolved');
      removeErrorOverlay();
    }

    if (data.type === 'error') {
      console.error('[parcel] 🚨  ' + data.error.message + '\n' + data.error.stack);
      removeErrorOverlay();
      var overlay = createErrorOverlay(data);
      document.body.appendChild(overlay);
    }
  };
}

function removeErrorOverlay() {
  var overlay = document.getElementById(OVERLAY_ID);

  if (overlay) {
    overlay.remove();
  }
}

function createErrorOverlay(data) {
  var overlay = document.createElement('div');
  overlay.id = OVERLAY_ID; // html encode message and stack trace

  var message = document.createElement('div');
  var stackTrace = document.createElement('pre');
  message.innerText = data.error.message;
  stackTrace.innerText = data.error.stack;
  overlay.innerHTML = '<div style="background: black; font-size: 16px; color: white; position: fixed; height: 100%; width: 100%; top: 0px; left: 0px; padding: 30px; opacity: 0.85; font-family: Menlo, Consolas, monospace; z-index: 9999;">' + '<span style="background: red; padding: 2px 4px; border-radius: 2px;">ERROR</span>' + '<span style="top: 2px; margin-left: 5px; position: relative;">🚨</span>' + '<div style="font-size: 18px; font-weight: bold; margin-top: 20px;">' + message.innerHTML + '</div>' + '<pre>' + stackTrace.innerHTML + '</pre>' + '</div>';
  return overlay;
}

function getParents(bundle, id) {
  var modules = bundle.modules;

  if (!modules) {
    return [];
  }

  var parents = [];
  var k, d, dep;

  for (k in modules) {
    for (d in modules[k][1]) {
      dep = modules[k][1][d];

      if (dep === id || Array.isArray(dep) && dep[dep.length - 1] === id) {
        parents.push(k);
      }
    }
  }

  if (bundle.parent) {
    parents = parents.concat(getParents(bundle.parent, id));
  }

  return parents;
}

function hmrApply(bundle, asset) {
  var modules = bundle.modules;

  if (!modules) {
    return;
  }

  if (modules[asset.id] || !bundle.parent) {
    var fn = new Function('require', 'module', 'exports', asset.generated.js);
    asset.isNew = !modules[asset.id];
    modules[asset.id] = [fn, asset.deps];
  } else if (bundle.parent) {
    hmrApply(bundle.parent, asset);
  }
}

function hmrAcceptCheck(bundle, id) {
  var modules = bundle.modules;

  if (!modules) {
    return;
  }

  if (!modules[id] && bundle.parent) {
    return hmrAcceptCheck(bundle.parent, id);
  }

  if (checkedAssets[id]) {
    return;
  }

  checkedAssets[id] = true;
  var cached = bundle.cache[id];
  assetsToAccept.push([bundle, id]);

  if (cached && cached.hot && cached.hot._acceptCallbacks.length) {
    return true;
  }

  return getParents(global.parcelRequire, id).some(function (id) {
    return hmrAcceptCheck(global.parcelRequire, id);
  });
}

function hmrAcceptRun(bundle, id) {
  var cached = bundle.cache[id];
  bundle.hotData = {};

  if (cached) {
    cached.hot.data = bundle.hotData;
  }

  if (cached && cached.hot && cached.hot._disposeCallbacks.length) {
    cached.hot._disposeCallbacks.forEach(function (cb) {
      cb(bundle.hotData);
    });
  }

  delete bundle.cache[id];
  bundle(id);
  cached = bundle.cache[id];

  if (cached && cached.hot && cached.hot._acceptCallbacks.length) {
    cached.hot._acceptCallbacks.forEach(function (cb) {
      cb();
    });

    return true;
  }
}
},{}]},{},["../../../../Users/marguspart/.config/yarn/global/node_modules/parcel-bundler/src/builtins/hmr-runtime.js","index.ts"], null)
//# sourceMappingURL=/index.js.map