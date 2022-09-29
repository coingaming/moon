import { createPopper } from '@popperjs/core';

export default {
    updated() {
        window.el = this.el
        const trigger = this.el.children[0];
        const tooltip = this.el.children[1];

        createPopper(trigger, tooltip, {
            placement: this.el.dataset.placement || 'bottom-start',
            strategy: 'fixed'
        });
    }
}
