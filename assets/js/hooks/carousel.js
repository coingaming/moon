export default {

    mounted() {
        this.reel = this.el.querySelector(".moon-reel");
        this.items = this.reel.querySelectorAll("li");
        this.itemCount = this.reel.querySelectorAll("li").length;
        this.leftArrow = this.el.querySelector(".moon-left-arrow");
        this.rightArrow = this.el.querySelector(".moon-right-arrow");
        if (this.leftArrow) {
            this.disableLeftArrow();
          };
        if (this.rightArrow) {
            this.disableRightArrow();
        };
        this.setupReelScroll();
    //     const delay = this.el.dataset.autoslide_delay;
    //     if (delay !== undefined) {
    //         this.startAutoSlide();
    //     }  
    },

    updated() {
        const activeItems = this.el.querySelectorAll(".active");
        activeItems.forEach(item => {
            item.scrollIntoView({
                behavior: 'smooth',
                block: 'nearest',
                inline: 'center'
            });
            let value = parseInt(item.getAttribute("value"), 10);
            this.disableLeftArrow();
            this.disableRightArrow();
        });

        this.setupReelScroll();
        // if (delay !== undefined) {
        //     clearTimeout(this.autoSlideTimeout);
        //     this.startAutoSlide();
        // }
    },

    setupReelScroll() {
        const scrollPosition = this.reel.scrollLeft;
        this.reel.addEventListener("scroll", (event) => {
            var totalWidth = 0;
            for (const item of this.items) {
                totalWidth += item.offsetWidth;
                if (totalWidth >= scrollPosition) {
                    // item.classList.add("active");
                    // this.items.classList.remove("active")

                    break;
                }
            };
          });

    },

    disableLeftArrow() {
        const activeItems = this.el.querySelectorAll(".active");
            activeItems.forEach(item => {
              const value = parseInt(item.getAttribute("value"), 10);          
              if (value === 0) {
                this.leftArrow.disabled = true;
              }
            });
    },

    disableRightArrow() {
        const activeItems = this.el.querySelectorAll(".active");
            activeItems.forEach(item => {
                const value = parseInt(item.getAttribute("value"), 10);
                if (value === this.itemCount - 1) {
                this.rightArrow.disabled = true;
                }
            });
    },
    
    // startAutoSlide() {
    //     this.autoSlideTimeout = setTimeout(() => {
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

