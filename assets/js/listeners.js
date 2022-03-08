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

window.addEventListener("moon:toggle-dropdown", (event) => {
  var detail = event.detail;
  var selectId = detail.select_id;
  var dropdownId = selectId + "-dropdown";
  var dropdown = document.getElementById(dropdownId);
  dropdown.classList.toggle("hidden");
  dropdown.classList.toggle("absolute");
});
