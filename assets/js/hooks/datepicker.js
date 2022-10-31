export default {
  mounted() {
    var element = this.el;
    var oldValue = element.value;
    var type = element.type;
    if (type === "date") {
      element.addEventListener("change", function (event) {
        var target = event.target;
        var value = target.value;
        if (value.length > 10) {
          var trimmed = value.substring(1);
          target.value = trimmed;
        }
      });
    }
  },

  updated() {
    if (this.el.value) {
      const newVal = this.el.dataset.pendingVal;
      if (newVal && this.el.value !== newVal) {
        this.el.value = newVal;
      }
    }
  },
};
