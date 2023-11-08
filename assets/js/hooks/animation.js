function getSelectionText() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    return text;
}

export default {

    hiddenClasses() {
        return ["sm", "md", "lg", "xl", "2xl"].map(size => `${size}:hidden`).concat(["hidden"]);
    },

    mounted() {
        this.backdrop = this.el.querySelector(".moon-backdrop");
        this.panel = this.el.querySelector(".moon-panel");
        this.showElementIfNeeded();
        //some dirty hack to make page scroll working after phx-style links are clicked
        window.addEventListener("phx:navigate", _ => {
            document.body.style.overflow = "auto";
        });
    },

    updated() {
        this.showElementIfNeeded();
        this.hideElementIfNeeded();
    },

    showElementIfNeeded() {
        (this.el.dataset.is_open === undefined) || !this.el.classList.contains("hidden")  || this.showElement();
    },

    hideElementIfNeeded() {
        if (this.el.dataset.is_closing === "true"){
            if (getSelectionText()) {
                this.pushEventTo(this.el, "stop_closing", {});
            } else {
                this.hideElement()
            }
        }
    },

    hideElement() {
        if(this.el.dataset.lg_persists !== undefined && document.body.clientWidth >= 1024) return;
        this.panel.classList.remove(...this.panel.dataset.animate_enter_class.split(" "));
        this.panel.classList.add(...this.panel.dataset.animate_leave_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.replace("animate-backdrop_enter", "animate-backdrop_leave");
        };
        setTimeout (() => {
            this.el.classList.add(...this.hiddenClasses())
            this.pushEventTo(this.el, "set_close", {});
            document.body.style.overflow = "auto";
            this.was_open = false;
        }, 200);
    },
    
    showElement() {
        this.el.classList.remove(...this.hiddenClasses());
        if(!this.was_open){
            this.panel.classList.add(...this.panel.dataset.animate_enter_class.split(" "));
            if (this.backdrop) {
                this.backdrop.classList.add("animate-backdrop_enter");
            }
        }
        this.was_open = this.el.dataset.is_open !== undefined;
        document.body.style.overflow = "hidden";
    },
};
      
