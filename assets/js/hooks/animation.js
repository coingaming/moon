export default {

    mounted() {
        this.backdrop = this.el.querySelector(".moon-backdrop");
        this.panel = this.el.querySelector(".moon-panel");
        this.showElementIfNeeded();
    },


    updated() {
        this.showElementIfNeeded();
        (this.el.dataset.is_closing === "true") && this.hideElement()
    },

    showElementIfNeeded() {
        (this.el.dataset.is_open === undefined) || !this.el.classList.contains("hidden")  || this.showElement();
    },

    hideElement() {
        if(this.el.dataset.lg_persists !== undefined && document.body.clientWidth >= 1024) return;
        this.panel.classList.remove(...this.panel.dataset.animate_enter_class.split(" "));
        this.panel.classList.add(...this.panel.dataset.animate_leave_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.replace("animate-backdrop_enter", "animate-backdrop_leave");
        };
        setTimeout (() => {
            this.el.classList.add("hidden", "lg:hidden")
            this.pushEventTo(this.el, "set_close", {});
            document.body.style.overflow = "auto";
        }, 200);
    },
    
    showElement() {
        this.el.classList.remove("hidden", "lg:hidden");
        this.panel.classList.add(...this.panel.dataset.animate_enter_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.add("animate-backdrop_enter");
        }
        document.body.style.overflow = "hidden";
    },
};
      
