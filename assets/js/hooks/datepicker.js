export default {
  updated() {
    if (this.el.value) {
      const newVal = this.el.dataset.pendingVal
      if (newVal && this.el.value !== newVal) {
        this.el.value = newVal
      }
    }
  }
}
