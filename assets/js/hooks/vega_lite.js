import * as vega from "vega"
import vegaEmbed from "vega-embed"

const VegaLite = {
  mounted() {
    this.viewPromise = vegaEmbed(this.el, JSON.parse(this.el.dataset.spec), {
      actions: false,
      theme: "latimes",
      renderer: 'svg',
      config: {
        legend: {
          disable: true
        }
      }
    })
      .then((result) => result.view)
      .catch((error) => {
        console.log(`Failed to render the given Vega-Lite specification, got the following error: ${error.message}`)
      })

    this.handleEvent(`vega_lite:${this.el.id}:redraw`, ({ data }) => {
      this.viewPromise.then((view) => {
        const changeset = vega.changeset().remove(() => true).insert(data)
        view.change('source_0', changeset).run()
      })
    })
  }
}

export default VegaLite
