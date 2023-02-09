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

window.addEventListener("moon:show-snackbar", (event) => {
  var elements = document.getElementsByClassName("moon-snackbar");
    for (let i = 0; i < elements.length; i++) {
      if (!elements[i].classList.contains("hidden")) {
        elements[i].classList.add("hidden");
        elements[i].classList.remove("block");
      }
    }

  var element = document.getElementById(event.detail.snackbar_id);
  const position = event.detail.position;
    if (element.classList.contains("hidden")) {
      element.classList.remove("hidden");
      element.classList.add("block");
        setTimeout(() => {
          element.classList.remove("animate-rightslide", "animate-leftslide", "animate-bottomslide", "animate-topslide");
        }, 200)
        setTimeout(() => {
          element.classList.add("animate-fadeout");
          setTimeout(() => {
            element.classList.add("hidden");
            element.classList.remove("block", "animate-fadeout");
            switch (position) {
              case "top-right": 
              case "bottom-right":
                element.classList.add("animate-rightslide");
                break;
              case "top-center":
                element.classList.add("animate-topslide");
                break;
              case "top-left":
              case "bottom-left":
                element.classList.add("animate-leftslide");
                break;
              case "bottom-center":
                element.classList.add("animate-bottomslide");
                break;
            };
          }, 300)
        }, event.detail.timeout || 5000); 
    };

    var element = document.getElementById(event.detail.snackbar_id); {
      clearTimeout();
    }
     });

    
 
window.addEventListener("moon:close-snackbar", (event) => {
  var element = document.getElementById(event.detail.snackbar_id);
  const position = event.detail.position;
    if (!element.classList.contains("hidden") ) {
      element.classList.add("animate-fadeout");
      setTimeout(() => {
        element.classList.add("hidden");
          switch (position) {
            case "top-right": 
            case "bottom-right":
              element.classList.add("animate-rightslide");
              break;
            case "top-center":
              element.classList.add("animate-topslide");
              break;
            case "top-left":
            case "bottom-left":
              element.classList.add("animate-leftslide");
              break;
            case "bottom-center":
              element.classList.add("animate-bottomslide");
              break;
          };
        element.classList.remove("block", "animate-fadeout");
      }, 300)
    } 
    var element = document.getElementById(event.detail.snackbar_id); {
      clearTimeout();
    };
  });
  
window.addEventListener("moon:queue-snackbar", (event) => {
  
});
