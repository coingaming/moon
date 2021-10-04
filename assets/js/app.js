// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in 'webpack.config.js'.
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from 'phoenix'
//     import socket from './socket'
//
import 'phoenix_html'
import { Socket } from 'phoenix'
import { LiveSocket } from 'phoenix_live_view'
import Alpine from 'alpinejs'

import Datepicker from './hooks/datepicker'

const hooks = {
  Datepicker
}

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute('content')

let liveSocket = new LiveSocket('/live', Socket, {
  hooks: hooks,
  dom: {
    onBeforeElUpdated(from, to) {
      if (from.__x) {
        Alpine.clone(from.__x, to)
      }
    }
  },
  params: { _csrf_token: csrfToken }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

