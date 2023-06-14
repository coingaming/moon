const getContent = (el) => document.getElementById(el.id + "-content")

export default {
    mounted() {
        this.handleStateChange(this.el);
    },

    updated() {
        this.handleStateChange(this.el);
    },

    handleStateChange(el) {
        if (el.dataset.is_open && !el.dataset.visible) {
            this.showContent(el);
        }
        if (!el.dataset.is_open && el.dataset.visible) {
            this.hideContent(el);
        }
    },

    hideContent(el) {
        el.dataset.visible = false;
        if (this.hidingTimeout) {
            clearTimeout(this.hidingTimeout);
        }
        let content = getContent(el);
        content.classList.replace(el.dataset.animate_class, "animate-fadeout");
        setTimeout(() => {
            content.classList.replace("animate-fadeout", "hidden")
            this.pushEventTo(el, "set_close", {});
        }, 500);
    },

    showContent(el) {
        el.dataset.visible = true;
        let content = getContent(el);
        this.hideAllSnackbarsExpect(el);
        content.classList.replace("hidden", el.dataset.animate_class);
        if (el.dataset.autoclose) {
            this.hidingTimeout = setTimeout(() => this.hideContent(el), el.dataset.timeout);
        }
    },

    hideAllSnackbarsExpect(el) {
        let snackbars = Array.from(document.querySelectorAll('[data-snackbar]'));
        snackbars.forEach(snackbar => {
            if (snackbar.id !== el.id && snackbar.dataset.is_open) {
                this.hideContent(snackbar);
            }
        });
    }
};
