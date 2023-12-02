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

import Animation from './animation'

export default {

    ...Animation,

    mounted() {
        Animation.mounted.bind(this)();
        this.dragHandle = this.el.querySelector(" & > .moon-panel > .bottom_sheet_header > .moon-drag-handle")
        console.log(this.dragHandle);
    },

    updated() {
        Animation.updated.bind(this)();
        if (this.dragHandle) {
            this.setupSwipePanel();
        };
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
            let position = Math.max(touch.pageY - startPosition.y, 0);
            const endPosition = panelHeight - position ;
            if (startedSwipe && endPosition <= panelHeight / 2) {
                this.panel.classList.add("animate-backdrop_leave_swipe");
                if (this.backdrop) {
                    this.backdrop.classList.replace("animate-backdrop_enter", "animate-backdrop_leave_swipe");
                };
                setTimeout (() => {
                    this.el.classList.add(...this.hiddenClasses())
                    this.pushEventTo(this.el, "set_close", {});
                    document.body.style.overflow = "auto";
                }, 100);
                startedSwipe = false;
            } else if (startedSwipe && endPosition > panelHeight / 2) {
                this.panel.style.transform = `translate(0, 0)`;
                startedSwipe = false;
            }
        });
    },     
};