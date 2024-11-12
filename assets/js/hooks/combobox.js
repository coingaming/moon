export default {
  mounted() {
    this.el.addEventListener("click", (event) => {
      event.stopPropagation();
    });
  },

  updated() {
    if (this.input === document.activeElement) {
      this.dropdown.classList.remove('hidden');
    }
  }
}