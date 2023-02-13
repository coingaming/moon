const queue = [];

const isVisible = (el) => !el.classList.contains("hidden") && !el.classList.contains("animate-fadeout")

const visibleEls = () => Array.from(document.getElementsByClassName('moon-snackbar')).filter(isVisible)

const hideEl = (el) => {
    el.dataset.to_hide && clearTimeout(el.dataset.to_hide);
    el.classList.replace(el.dataset.animate_class, "animate-fadeout");
    setTimeout (() => el.classList.replace("animate-fadeout", "hidden"), 500);
    if(queue.length) showEl(queue.shift());
    pushEvent("toggle_open", {});
}

const showEl = (el) => {
    visibleEls().map(hideEl);
    el.classList.replace("hidden", el.dataset.animate_class);
    el.dataset.to_hide = setTimeout(() => hideEl(el), el.dataset.timeout || 5000);
}

const showOrQueue = (el) => {
    (el.dataset.in_queue !== undefined && !visibleEls().length) && queue.push(el) || showEl(el);
}

export default {
    mounted() {
        // console.log("mounted", this.el);
        this.el.dataset.is_open === undefined || showOrQueue(this.el);
    },
    updated() {
        // console.log("updated", this.el);
        if(this.el.dataset.is_open === undefined) {
            isVisible(this.el) && hideEl(this.el);
        } else {
            isVisible(this.el) || showEl(this.el);
        }
    },
};
  