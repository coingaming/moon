
 const addEvent = (() => {
	if (document.addEventListener) {
		return (el, type, fn) => {
			if (el && el.nodeName || el === window) {
				el.addEventListener(type, fn, false);
			} else if (el && el.length) {
				for (let i = 0; i < el.length; i++) {
					addEvent(el[i], type, fn);
				}
			}
		};
	} else {
		return (el, type, fn) => {
			if (el && el.nodeName || el === window) {
				el.attachEvent(`on${type}`, () => { return fn.call(el, window.event); });
			} else if (el && el.length) {
				for (let i = 0; i < el.length; i++) {
					addEvent(el[i], type, fn);
				}
			}
		};
	}
})();

export default {

    mounted() {
        this.backdrop = this.el.querySelector(".moon-backdrop");
        this.panel = this.el.querySelector(".moon-panel");
        this.showElementIfNeeded();
    },


    updated() {
        this.showElementIfNeeded();
        (this.el.dataset.is_closing === "true") && this.hideElement();
        this.setupSwipePanel();
    },

    showElementIfNeeded() {
        (this.el.dataset.is_open === undefined) || !this.el.classList.contains("hidden")  || this.showElement();
    },

    hideElement() {
        this.panel.classList.remove(...this.panel.dataset.animate_enter_class.split(" "));
        this.panel.classList.add(...this.panel.dataset.animate_leave_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.replace("animate-backdrop_enter", "animate-backdrop_leave");
        };
        setTimeout (() => {
            this.el.classList.add("hidden")
            this.pushEventTo(this.el, "set_close", {});
            document.body.style.overflow = "auto";
        }, 200);
    },
    
    showElement() {
        this.el.classList.remove("hidden");
        this.panel.classList.add(...this.panel.dataset.animate_enter_class.split(" "));
        if (this.backdrop) {
            this.backdrop.classList.add("animate-backdrop_enter");
        }
        document.body.style.overflow = "hidden";
    },

    setupSwipePanel() {
        
        const startPosition = {
            x: 0,
            y: 0
         };
        
         let startedSwipe = false;
        
        addEvent(document.body, "touchstart", event => {
            const touch = event.targetTouches[0];
            if ((this.el.dataset.is_open !== undefined)) {
                startPosition.x = touch.pageX;
                startPosition.y = touch.pageY;
                panelHeight = this.panel.offsetHeight;
                startedSwipe = true;
            }
        });

        addEvent(document.body, "touchmove", event => {
            const touch = event.targetTouches[0];
            if (startedSwipe && (this.el.dataset.is_open !== undefined) && touch.pageY > startPosition.y) {
                let position = Math.max(touch.pageY - startPosition.y, 0);
                this.panel.style.transform = `translate(0, ${position}px)`;
             } 
        });
    
        addEvent(document.body, "touchend", event => {
            const touch = event.changedTouches[0];
            const panelHeight = this.panel.offsetHeight;
            if (startedSwipe && touch.pageY <= panelHeight / 2) {
                console.log("close panel");
                (this.el.dataset.is_open === undefined);
                startedSwipe = false;
            } else if (startedSwipe && touch.pageY > panelHeight / 2) {
                console.log("open panel");
                (this.el.dataset.is_open !== undefined);
                startedSwipe = false;
            }
        });
    },

    

    
     
};
      




