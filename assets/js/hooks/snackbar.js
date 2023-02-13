const queue = [];

const isVisible = (el) => !el.classList.contains("hidden") && !el.classList.contains("animate-fadeout")

const visibleElements = () => Array.from(document.getElementsByClassName('moon-snackbar')).filter(isVisible)

const hideElement = (el) => {
    el.dataset.to_hide && clearTimeout(el.dataset.to_hide);
    el.classList.replace(el.dataset.animate_class, "animate-fadeout");
    setTimeout (() => el.classList.replace("animate-fadeout", "hidden"), 500);
    if(queue.length) showElement(queue.shift());
    pushEvent("set_close", {});
}

const showElement = (el) => {
    visibleElements().map(hideElement);
    el.classList.replace("hidden", el.dataset.animate_class);
    el.dataset.to_hide = setTimeout(() => hideElement(el), el.dataset.timeout || 5000);
}

const showOrQueue = (el) => {
    (el.dataset.in_queue !== undefined && !visibleElements().length) && queue.push(el) || showElement(el);
}

export default {
    mounted() {
        this.el.dataset.is_open === undefined || showOrQueue(this.el);
    },
    updated() {
        if(this.el.dataset.is_open === undefined) {
            isVisible(this.el) && hideElement(this.el);
        } else {
            isVisible(this.el) || showOrQueue(this.el);
        }
    },
    
};
  