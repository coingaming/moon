export default {
    hiddenClasses() {
        return ["sm", "md", "lg", "xl", "2xl"]
            .map((size) => `${size}:hidden`)
            .concat(["hidden"]);
    },

    mounted() {
        this.backdrop = this.el.querySelector(".moon-backdrop");
        this.panel = this.el.querySelector(".moon-panel");
        this.showElementIfNeeded();
        //some dirty hack to make page scroll working after phx-style links are clicked
        window.addEventListener("phx:navigate", (_) => {
            document.body.style.overflow = "auto";
        });
    },

    updated() {
        this.showElementIfNeeded();
        this.el.dataset.is_closing === "true" && this.hideElement();
        this.el.dataset.is_closing_on_click_away === "true" &&
            this.hideElementOnClickAway();
    },

    showElementIfNeeded() {
        this.el.dataset.is_open === undefined ||
            !this.el.classList.contains("hidden") ||
            this.showElement();
    },

    hideElement() {
        if (
            this.el.dataset.lg_persists !== undefined &&
            document.body.clientWidth >= 1024
        )
            return;
        this.panel.classList.remove(
            ...this.panel.dataset.animate_enter_class.split(" ")
        );
        this.panel.classList.add(
            ...this.panel.dataset.animate_leave_class.split(" ")
        );
        if (this.backdrop) {
            this.backdrop.classList.replace(
                "animate-backdrop_enter",
                "animate-backdrop_leave"
            );
        }
        setTimeout(() => {
            this.el.classList.add(...this.hiddenClasses());
            this.pushEventTo(this.el, "set_close", {});
            document.body.style.overflow = "auto";
        }, 200);
    },

    hideElementOnClickAway() {
        this.el.addEventListener("mousedown", (event) => {
            if (!this.panel.contains(event.target)) {
                this.hideElement();
            }
            event.stopPropagation();
        });
    },

    showElement() {
        this.el.classList.remove(...this.hiddenClasses());
        this.panel.classList.add(
            ...this.panel.dataset.animate_enter_class.split(" ")
        );
        if (this.backdrop) {
            this.backdrop.classList.add("animate-backdrop_enter");
        }
        document.body.style.overflow = "hidden";
    },
};
