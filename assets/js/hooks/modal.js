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
        this.panel.classList.replace("animate-modal_enter", "animate-modal_leave");
        this.backdrop.classList.replace("animate-backdrop_enter", "animate-backdrop_leave");
        setTimeout (() => {
            this.el.classList.add("hidden")
            this.pushEventTo(this.el, "close_modal", {});
            document.body.style.overflow = "auto";
        }, 200);
    },
    
    showElement() {
        this.el.classList.remove("hidden");
        this.backdrop.classList.add("animate-backdrop_enter");
        this.panel.classList.add("animate-modal_enter");
        document.body.style.overflow = "hidden";
        
    },
};
      
