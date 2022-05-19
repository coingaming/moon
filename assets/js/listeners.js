window.addEventListener("moon:update-select", (event) => {
  var select = event.target;
  var detail = event.detail;
  for (var i in select.options) {
    var option = select.options[i];
    if (option.value == detail.value) {
      option.selected = detail.selected;
    }
  }
  select.dispatchEvent(
    new Event("input", { bubbles: true })
  )
});

window.addEventListener("moon:rotate-accordion-arrow", (event) => {
  var element = event.target;
  var hasClass = element.classList.contains("rotate-0");
  if (hasClass) {
    element.classList.add("rotate-180");
    element.classList.remove("rotate-0");
  } else {
    element.classList.add("rotate-0");
    element.classList.remove("rotate-180");
  }
});
