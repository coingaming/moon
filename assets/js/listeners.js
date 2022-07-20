window.addEventListener("moon:update-select", (event) => {
  var select = event.target;
  var detail = event.detail;
  for (var i in select.options) {
    var option = select.options[i];
    if (option.value == detail.value) {
      option.selected = detail.selected;
    }
  }
  select.dispatchEvent(new Event("input", { bubbles: true }));
});

window["moon:breadcumbs-close-handlers"] = {};

window.addEventListener("moon:show-collapsed-breadcrumbs", (event) => {
  var detail = event.detail;
  var breacrumb_flyout_id = detail.breacrumb_flyout_id;
  var element = document.getElementById(breacrumb_flyout_id);
  element.classList.add("flex");
  element.classList.remove("hidden");

  var breacrumb_flyout_id_closer = (e) => {
    if (!e.target.contains(element)) {
      element.classList.add("hidden");
      element.classList.remove("flex");

      document.removeEventListener(
        "click",
        window["moon:breadcumbs-close-handlers"][breacrumb_flyout_id]
      );
      delete window["moon:breadcumbs-close-handlers"][breacrumb_flyout_id];
    }
  };

  document.addEventListener("click", breacrumb_flyout_id_closer);

  window["moon:breadcumbs-close-handlers"][breacrumb_flyout_id] =
    breacrumb_flyout_id_closer;
});
