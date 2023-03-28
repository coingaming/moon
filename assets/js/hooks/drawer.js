const isVisible = (el) => !el.classList.contains("hidden") 

export default {

    mounted() {
        this.el.dataset.is_open === undefined || this.showElement();
    },

    updated() {
            
        if (this.el.children.length > 1) {
            this.backdrop = this.el.children[0];
            this.panel = this.el.children[1];
            console.log(this.backdrop)
        } else {
            this.panel = this.el.children[0];
        }
        (this.el.dataset.is_open === undefined) || isVisible(this.el) || this.showElement();

    },

    hideElement() {
        this.panel.classList.replace(this.panel.dataset.animate_enter_class, this.panel.dataset.animate_leave_class);
        if (this.backdrop) {
            this.backdrop.classList.replace("animate-backdropenter", "animate-backdropleave");
        };
        setTimeout (() => {
            this.el.classList.add("hidden")
            this.pushEventTo(this.el.parentNode, "close_drawer", {});
        }, 300);
    },
    
    showElement() {
        this.el.classList.remove("hidden");
        this.panel.classList.add(this.panel.dataset.animate_enter_class);
            if (this.backdrop) {
                this.backdrop.classList.add("animate-backdropenter");
            }
            },
};

  
window.addEventListener("moon:close-drawer", (event) => {
    
    var detail = event.detail;
    var drawer_panel_id = detail.drawer_panel_id;
    var element = document.getElementById(drawer_panel_id);
    var outsideClick = !element.contains(event.target);
  
   if (outsideClick) {
    console.log("hurraaaa")
    }
    
});

      
