let Datepicker = {
  mounted() {
    if (this.el.value) {
      this.pushEventTo("#" + this.el.id, "select_date", { date: this.el.value })
    }
  },
  updated() {
    if (this.el.value) {
      let params = {}
      params[this.el.dataset.name] = this.el.value
      this.pushEventTo("#" + this.el.id, "update_date", params)
    }
  }
}

export { Datepicker }
