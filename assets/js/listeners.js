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

window.addEventListener("moon:update-switch", (event) => {
  var radio_true = event.target;
  var detail = event.detail;
  var switch_id = detail.switch_id;
  var radio_false = document.getElementById(switch_id + "_radio_false");
  if (detail.checked) {
    radio_true.checked = true;
    radio_true.dispatchEvent(new Event("input", { bubbles: true }));
  } else {
    radio_false.checked = true;
    radio_false.dispatchEvent(new Event("input", { bubbles: true }));
  }
});

window.addEventListener("moon:update-accordion-aria", (event) => {
  var accordion_id = event.detail.accordion_id;
  var element = document.getElementById(accordion_id);
  var ariaExpanded = element.getAttribute("aria-expanded");
  if (ariaExpanded == "true") {
    element.setAttribute("aria-expanded", "false");
  } else {
    element.setAttribute("aria-expanded", "true");
  }
});

window.addEventListener("moon:toggle-collapsed-breadcrumbs", (event) => {
  var detail = event.detail;
  var breacrumb_flyout_id = detail.breacrumb_flyout_id;
  var element = document.getElementById(breacrumb_flyout_id);
    if (element.classList.contains("hidden")) {
      element.classList.add("flex");
      element.classList.remove("hidden");
    } else {
      element.classList.add("hidden");
      element.classList.remove("flex");}
});

window.addEventListener("moon:close-breadcrumb-flyout", (event) => {
  var detail = event.detail;
  var breacrumb_flyout_id = detail.breacrumb_flyout_id;
  var element = document.getElementById(breacrumb_flyout_id);
    if (!event.target.element && element.classList.contains("flex")) {
      element.classList.remove("flex");
      element.classList.add("hidden");}
});

window.addEventListener("moon2:update-switch", (event) => {
  let checkbox = event.target;
  checkbox.checked = event.detail.checked;
  checkbox.dispatchEvent(new Event("input", { bubbles: true }));
});

window.addEventListener("moon2:clean-checkboxes", (event) => {
  let checkboxes = event.target.parentNode.parentNode.parentNode.querySelectorAll('input[type=checkbox]')
  checkboxes.forEach(cb => cb.checked = false);
  checkboxes[0].dispatchEvent(new Event("input", { bubbles: true }))
});

