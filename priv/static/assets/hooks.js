(() => {
  // js/hooks/datepicker.js
  var datepicker_default = {
    updated() {
      if (this.el.value) {
        const newVal = this.el.dataset.pendingVal;
        if (newVal && this.el.value !== newVal) {
          this.el.value = newVal;
        }
      }
    }
  };

  // js/hooks/index.js
  var hooks_default = {
    Datepicker: datepicker_default
  };
})();
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vYXNzZXRzL2pzL2hvb2tzL2RhdGVwaWNrZXIuanMiLCAiLi4vLi4vLi4vYXNzZXRzL2pzL2hvb2tzL2luZGV4LmpzIl0sCiAgInNvdXJjZXNDb250ZW50IjogWyJleHBvcnQgZGVmYXVsdCB7XG4gIHVwZGF0ZWQoKSB7XG4gICAgaWYgKHRoaXMuZWwudmFsdWUpIHtcbiAgICAgIGNvbnN0IG5ld1ZhbCA9IHRoaXMuZWwuZGF0YXNldC5wZW5kaW5nVmFsXG4gICAgICBpZiAobmV3VmFsICYmIHRoaXMuZWwudmFsdWUgIT09IG5ld1ZhbCkge1xuICAgICAgICB0aGlzLmVsLnZhbHVlID0gbmV3VmFsXG4gICAgICB9XG4gICAgfVxuICB9XG59XG4iLCAiaW1wb3J0IHsgZGVmYXVsdCBhcyBEYXRlcGlja2VyIH0gZnJvbSAnLi9kYXRlcGlja2VyJ1xuXG5leHBvcnQgZGVmYXVsdCB7XG4gIERhdGVwaWNrZXJcbn1cbiJdLAogICJtYXBwaW5ncyI6ICI7O0FBQUEsTUFBTyxxQkFBUTtBQUFBLElBQ2IsVUFBVTtBQUNSLFVBQUksS0FBSyxHQUFHLE9BQU87QUFDakIsY0FBTSxTQUFTLEtBQUssR0FBRyxRQUFRO0FBQy9CLFlBQUksVUFBVSxLQUFLLEdBQUcsVUFBVSxRQUFRO0FBQ3RDLGVBQUssR0FBRyxRQUFRO0FBQUE7QUFBQTtBQUFBO0FBQUE7OztBQ0h4QixNQUFPLGdCQUFRO0FBQUEsSUFDYjtBQUFBOyIsCiAgIm5hbWVzIjogW10KfQo=
