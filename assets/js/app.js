import 'phoenix_html'
import { Socket } from 'phoenix'
import { LiveSocket } from 'phoenix_live_view'
import hooks from './hooks'
import _hooks from './_hooks'
import S3 from "./uploaders/s3"
import setCookie from "./cookies/set-cookie"
import setIsMobile from './set-is-mobile'

setIsMobile()

let uploaders = {
  S3
}

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute('content')

let liveSocket = new LiveSocket('/live', Socket, {
  uploaders,
  hooks: { ...hooks, ..._hooks },
  params: { _csrf_token: csrfToken }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
// >> liveSocket.enableProfiling();
window.liveSocket = liveSocket

// app-specific listeners
window.addEventListener("phx:page-loading-stop", info => {
  var activeLink = document.querySelectorAll('[data-moon-active]');
  if (activeLink[0]) {
    activeLink[0].scrollIntoView();
  }
})

window.addEventListener("phx:set-cookie", e => {
  setCookie(e.detail.name, e.detail.value);
})
