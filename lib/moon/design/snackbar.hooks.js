const isVisible = (el) => !el.classList.contains("hidden") && !el.classList.contains("animate-fadeout")

const visibleElements = () => Array.from(document.getElementsByClassName('moon-snackbar')).filter(isVisible)



export default {

    mounted() {
        this.el.dataset.is_open === undefined || this.showElement(this.el);
    },

    updated() {
        (this.el.dataset.is_open === undefined) || isVisible(this.el) || this.showElement(this.el);
    },

    hideElement(el) {
        el.dataset.to_hide && clearTimeout(el.dataset.to_hide);
        el.classList.replace(el.dataset.animate_class, "animate-fadeout");
        setTimeout (() => {
            el.classList.replace("animate-fadeout", "hidden")
            this.pushEventTo(el.parentNode, "set_close", {});
        }, 500);
    },
    
    showElement(el) {
        visibleElements().map(this.hideElement.bind(this));
        el.classList.replace("hidden", el.dataset.animate_class);
        el.dataset.to_hide = setTimeout(() => this.hideElement(el), el.dataset.timeout || 5000);
    },
};
  