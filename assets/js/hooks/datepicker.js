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
          console.log(trimmed);
        }
      });
    } else {
      element.addEventListener("keyup", function (event) {
        var target = event.target;
        var value = element.value;
        console.log("-----");
        console.log(value);
        console.log(event);

        // var pattern = /^([\d]){4}\-[\d]{2}\-[\d]{2}T[\d]{2}\:[\d]{2}$/;
        // var is_match = pattern.test(value);
        // console.log("***");
        // console.log(is_match);
        // console.log(value);
        // console.log("--");
        // if (!is_match) {
        //   if (oldValue) {
        //     console.log("using old value");
        //     console.log(oldValue);
        //     target.value = oldValue;
        //   } else {
        //     console.log("using trimmed value");
        //     var trimmed = value.substring(2);
        //     console.log("value " + value);
        //     console.log("trimmed " + trimmed);
        //     target.value = trimmed;
        //     oldValue = trimmed;
        //   }
        // } else {
        //   oldValue = value;
        // }
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
