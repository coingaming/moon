const isVisible = (el) => !el.classList.contains("hidden") 

export default {

    mounted() {
        if (this.el.children.length > 1) {
            this.backdrop = this.el.children[0];
            this.panel = this.el.children[1];
        } else {
            this.panel = this.el.children[0];
        }
    },

    updated() {
        (this.el.dataset.is_open === undefined) || isVisible(this.el) || this.showElement();
        if (this.el.dataset.is_closing === "true") {
            this.hideElement()
        }
    },

    hideElement() {
        this.panel.classList.remove(...this.panel.dataset.animate_enter_class.split(" "));
        this.panel.classList.add(...this.panel.dataset.animate_leave_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.replace("animate-backdropenter", "animate-backdropleave");
        };
        setTimeout (() => {
            this.el.classList.add("hidden")
            this.pushEventTo(this.el, "close_drawer", {});
        }, 200);
    },
    
    showElement() {
        this.el.classList.remove("hidden");
        this.panel.classList.add(...this.panel.dataset.animate_enter_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.add("animate-backdropenter");
        }
    },
};
      
