export default {
    // data() {
    //     return {
    //       delay: undefined,
    //       autoSlideTimeout: null
    //     };
    //   },

    mounted() {
        this.reel = this.el.querySelector(".moon-reel");
        this.items = this.reel.querySelectorAll("li");
        // console.log(this.items)
        this.itemCount = this.reel.querySelectorAll("li").length;
        this.leftArrow = this.el.querySelector(".moon-left-arrow");
        this.rightArrow = this.el.querySelector(".moon-right-arrow");
        this.setupReelScroll();
        this.diableArrows();
        // this.delay = parseInt(this.el.dataset.autoslide_delay, 10);
        // if (!isNaN(this.delay)) {
        //     this.startAutoSlide(this.delay);
        //   }
    },

    updated() {
        this.scrollToActiveItem();
        this.setupReelScroll();
        // if (!isNaN(this.delay)) {
        //     clearTimeout(this.autoSlideTimeout);
        //     this.startAutoSlide(this.delay);
        //   }
    },
        
    scrollToActiveItem(toScroll = true) {
        const item = this.el.querySelector(".active");
        if (toScroll) {
            item.scrollIntoView({
                behavior: 'smooth',
                block: 'nearest',
                inline: 'center'
            });
        };
        this.diableArrows();
        
        const indicator = this.el.querySelector(".moon-indicator");
        console.log(indicator)
    },

    diableArrows() {
        const item = this.el.querySelector(".active");
        const value = parseInt(item.getAttribute("value"), 10);          
        if (value === 0 && this.leftArrow) {
            this.leftArrow.disabled = true; //TODO: enable button when needed
        };
        if (value === this.itemCount - 1 && this.rightArrow) {
            this.rightArrow.disabled = true; //TODO: enable button when needed
        };
    },

    setupReelScroll() {
        this.reel.addEventListener("scroll", () => {
            const scrollPosition = this.reel.scrollLeft;
            var totalWidth = 0;
            for (const item of this.items) {
                totalWidth += item.offsetWidth;
                console.log(totalWidth, scrollPosition, item.offsetWidth)
                if (scrollPosition >= totalWidth) {
                    this.items.forEach(i => i.classList.remove("active"));
                    item.classList.add("active");
                    // const value = parseInt(item.getAttribute("value"), 10);   
                    // const newValue = (value + 1);
                    // const newItem = this.el.querySelector(`[data-value="${newValue}"]`);
                    // if (newItem) {
                    //     newItem.classList.add("active");
                    //   }
                    // item.classList.add("active");
                    // this.scrollToActiveItem(false);
                    break;
                }
            }
          });

    },
    
    // startAutoSlide() {
    //     this.autoSlideTimeout = setTimeout(() => {
    //         const activeItems = this.el.querySelectorAll(".active");
    //         activeItems.forEach((item) => {
    //           const value = parseInt(item.getAttribute("value"), 10);
    //           const step = parseInt(this.el.dataset.step, 10);
    //           const nextValue = (value + step) % activeItems.length;
    //           activeItems[nextValue].scrollIntoView({
    //             behavior: "smooth",
    //             block: "nearest",
    //             inline: "center",
    //           });
    //         });
    //       }, this.delay);
        
    //     this.autoSlideTimeout = setTimeout(() => {
    //         console.log(this.autoSlideTimeout)
    //         const activeItems = this.el.querySelectorAll(".active");
    //         activeItems.forEach(item => {
    //             const value = parseInt(item.getAttribute("value"), 10);
    //             const step = parseInt(this.el.dataset.step, 10)
    //             const nextValue = (value + step) % activeItems.length;
    //             activeItems[nextValue].scrollIntoView({
    //                 behavior: 'smooth',
    //                 block: 'nearest',
    //                 inline: 'center'
    //             });
    //         });
    //     }, this.el.dataset.autoslide_delay);
    // }
};

