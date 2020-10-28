# shim-keyboard-event-key

Tiny `KeyboardEvent#key` shim for IE and MS Edge.

* [MS Edge bug report](https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/8860571)
* [Can I use `key`?](http://caniuse.com/#feat=keyboardevent-key)
* [W3C: UI Events spec](https://www.w3.org/TR/uievents)
* [W3C: `key` values](https://www.w3.org/TR/uievents-key)

## Up and running

Get the package from [npm](https://www.npmjs.com/package/shim-keyboard-event-key):

```sh
npm install shim-keyboard-event-key --save
```

And simply require the module:

```js
import "shim-keyboard-event-key"
```

Otherwise, plug it the old-fashioned way:

```html
<script src="https://unpkg.com/shim-keyboard-event-key" async></script>
```

## Example

```js
document.addEventListener("keyup", event => {
  if (event.defaultPrevented) return

  switch (event.key) {
    case "ArrowLeft":
    case "PageUp":
      player.prev()
      break

    case "ArrowRight":
    case "PageDown":
      player.next()
      break
  }
})
```
