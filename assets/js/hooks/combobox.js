export default {
  mounted() {
    this.input = this.el.querySelector('.moon-comboinput');
    this.dropdown = this.el.children[1];
  },

  updated() {
    if (this.input === document.activeElement) {
      this.dropdown.classList.remove('hidden');
    }else {
      this.dropdown.classList.add('hidden');
    }
  }
}