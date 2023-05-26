export default {
    mounted() {
        this.reel = this.el.querySelector(".moon-reel");
        this.items = this.reel.querySelectorAll("li");
        this.indicators = this.el.querySelectorAll(".moon-indicator");
        this.itemCount = this.items.length;
        this.leftArrow = this.el.querySelector(".moon-left-arrow");
        this.rightArrow = this.el.querySelector(".moon-right-arrow");
        this.itemsArray = this.getArray("li", this.reel);
        this.indicatorsArray = this.getArray(".moon-indicator", this.el);
        this.initScrolls();
        this.setActiveItem();
        this.initIntersectionObserver();
        this.el.addEventListener("triggerLeftArrowClick", () => {
            this.handleLeftArrowClick();
        });
        this.el.addEventListener("triggerRightArrowClick", () => {
            this.handleRightArrowClick();
        }); 
        this.delay = parseInt(this.el.dataset.autoslide_delay, 10);
        if (!isNaN(this.delay)) {
            this.startAutoSlide(this.delay);
        };
    },
    
    updated() {
        this.scrollToIndex();
    },

    setActiveItem() {
        const value = parseInt(this.el.dataset.value, 10);
        const lastIndex = this.itemsArray.length - 1;
        const scrollToIndex = this.itemsArray.findIndex((item, index) => index === value);

        if (scrollToIndex < lastIndex && scrollToIndex !== -1) {
             this.scrollIntoViewSmoothly(this.itemsArray[scrollToIndex], {
                block: "nearest",
                behavior: "smooth",
                inline: "nearest",
                boundary: this.reel,
            });
        }
    },

    initScrolls() {
        const scrollIntoView = require("scroll-into-view-if-needed").scrollIntoView;
        const smoothScrollIntoView = require("mooth-scroll-into-view-if-needed").smoothScrollIntoView;

        this. this.scrollIntoViewSmoothly;
        
        if (document && "scrollBehavior" in document.documentElement.style) {
        this. this.scrollIntoViewSmoothly = scrollIntoView;
        } else {
        this. this.scrollIntoViewSmoothly = smoothScrollIntoView;
        };
    },
    
    handleLeftArrowClick() {
        const firstVisibleIndex = this.findFirstVisibleIndex();
        const step = parseInt(this.el.dataset.step, 10);
        const actualScrollForIndex = firstVisibleIndex < step 
            ? 0 
            : firstVisibleIndex - step;
        const scrollToIndex = this.itemsArray.findIndex((item, index) => index === actualScrollForIndex);
        
            if (scrollToIndex !== -1) {
                 this.scrollIntoViewSmoothly(this.itemsArray[scrollToIndex], {
                  block: "nearest",
                  inline: step === 1 ? "center" : "nearest",
                  behavior: "smooth",
                  boundary: this.reel,
                });
            }
    },

    handleRightArrowClick() {
        const lastVisibleIndex = this.findLastVisibleIndex();
        const step = parseInt(this.el.dataset.step, 10);
        const lastIndex = this.itemsArray.length - 1;
        const actualScrollForIndex = lastIndex - lastVisibleIndex < step
            ? lastIndex
            : lastVisibleIndex + step;
        const scrollToIndex = this.itemsArray.findIndex((item, index) => index === actualScrollForIndex);
        
            if (scrollToIndex !== -1) {
                 this.scrollIntoViewSmoothly(this.itemsArray[scrollToIndex], {
                  block: "nearest",
                  inline: step === 1 ? "center" : "nearest",
                  behavior: "smooth",
                  boundary: this.reel,
                });
            }
    },
    
    scrollToIndex() {
        const item = this.el.querySelector(".active");
        const step = parseInt(this.el.dataset.step, 10);
            if (item) {
               this.scrollIntoViewSmoothly(item, {
                block: "nearest",
                inline: step === 1 ? "center" : "nearest",
                behavior: "smooth",
                boundary: this.reel,
              });
            }
    },

    getArray(selector, element) {
        const elements = Array.from(element.querySelectorAll(selector));
        return elements;
    },

    initIntersectionObserver() {
        const observer = new IntersectionObserver(
            (entries) => {
              entries.forEach((entry) => {
                entry.intersectionRatio >= 0.75
                ? this.processVisibleEntry(entry)
                : this.processNotVisibleEntry(entry)
              });
              this.disableArrows();
            },
            {
              root: this.reel,
              threshold: 0.75,
            }
          );
            this.items.forEach((item) => {
                observer.observe(item);
            });
            return () =>
            this.items.forEach((item) => {
                observer.unobserve(item);
            });
    },

    processVisibleEntry(entry) {
        entry.target.setAttribute("visible", "true")
        const itemIndex = this.itemsArray.indexOf(entry.target);
        const indicator = this.indicatorsArray[itemIndex];

        if (entry.target.getAttribute("visible") === "true" && indicator) {
            indicator.classList.remove(indicator.dataset.default_bg_color);
            indicator.classList.add(indicator.dataset.selected_bg_color);
            entry.target.classList.add("active");
            };
    },

    processNotVisibleEntry(entry) {
        entry.target.removeAttribute("visible")
        const itemIndex = this.itemsArray.indexOf(entry.target);
        const indicator = this.indicatorsArray[itemIndex];

        if (entry.target.getAttribute("visible") !== "true" && indicator) {
            entry.target.classList.remove("active");
            indicator.classList.add(indicator.dataset.default_bg_color);
            indicator.classList.remove(indicator.dataset.selected_bg_color);
            };
    },
  
    findFirstVisibleIndex() {
        return this.itemsArray.findIndex(item => item.getAttribute("visible") === "true");
    },

    findLastVisibleIndex() { 
        const reversedIndex = this.itemsArray
        // "reverse" mutates existing array, that"s why we copy it via "slice"
          .slice()
          .reverse()
          .findIndex(item => item.getAttribute("visible") === "true");
        const count = this.itemsArray.length - 1;
        const finalIndex = reversedIndex >= 0 ? count - reversedIndex : reversedIndex;
        return finalIndex;
      },

    disableArrows() {
        const firstVisibleIndex = this.findFirstVisibleIndex();
        const lastVisibleIndex = this.findLastVisibleIndex();
      
        if (firstVisibleIndex === 0 && this.leftArrow) {
            this.leftArrow.disabled = true;
        } else if (this.leftArrow) {
            this.leftArrow.disabled = false;
        };
      
        if (lastVisibleIndex === this.itemCount - 1 && this.rightArrow) {
            this.rightArrow.disabled = true;
        } else if (this.rightArrow) {
            this.rightArrow.disabled = false;
        };
    },
    
    startAutoSlide() {
        this.autoSlideTimeout = setInterval(() => {
            const lastVisibleIndex = this.findLastVisibleIndex();
            const step = parseInt(this.el.dataset.step, 10);
            const lastIndex = this.itemsArray.length - 1;
            const actualScrollForIndex = (lastVisibleIndex + step) % (lastIndex + 1);
            let scrollToIndex = this.itemsArray.findIndex((item, index) => index === actualScrollForIndex);

            if (scrollToIndex === lastIndex && this.itemsArray[lastVisibleIndex] === this.itemsArray[scrollToIndex]) {
                scrollToIndex = 0; 
            }

             this.scrollIntoViewSmoothly(this.itemsArray[scrollToIndex], {
                block: "nearest",
                inline: step === 1 ? "center" : "nearest",
                behavior: "smooth",
                boundary: this.reel,
            });
          }, this.delay);
    }
};