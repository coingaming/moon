export default {
    mounted() {
        this.inputs = Array.from(
            this.el.querySelectorAll('input:not([type="hidden"])')
        );
        this.hiddenField = this.el.querySelector('input[type="hidden"]');
        this.inputValues = this.inputs.map((input) => input.value);
        this.form = this.el.dataset.has_form !== undefined;
        this.handleOnChange();
        this.handleOnKeydown();
        this.handleOnPaste();
    },

    updated() {},

    handleOnChange() {
        this.inputs.forEach((input, index) => {
            input.addEventListener("input", (event) => {
                const value = event.target.value;
                const nextInput = this.inputs[index + 1];
                const pattern = input.getAttribute("pattern");

                if (value.length > 1) {
                    event.target.value = value.charAt(0);
                    if (nextInput !== undefined && !this.form) {
                        nextInput.focus();
                    }
                } else if (value.match(new RegExp(pattern, "gi"))) {
                    if (nextInput !== undefined && !this.form) {
                        nextInput.focus();
                    }
                } else {
                    event.target.value = "";
                }
                event.preventDefault();

                this.updateHiddenField();
            });
        });
    },

    handleOnKeydown() {
        this.inputs.forEach((input, index) => {
            input.addEventListener("keydown", (event) => {
                const prevInput = this.inputs[index - 1];

                if (event.key === "Backspace" && !this.form) {
                    if (input.value === "") {
                        if (prevInput !== undefined) {
                            prevInput.value = "";
                            prevInput.focus();
                        }
                    } else {
                        input.value = "";
                    }
                    this.updateHiddenField();
                    event.preventDefault();
                }
            });
        });
    },

    handleOnPaste() {
        this.inputs.forEach((input, index) => {
            input.addEventListener("paste", (event) => {
                const count = this.inputs.length - 1;
                const lastInput = this.inputs[count];

                const pastedValue = event.clipboardData.getData("Text");
                const pattern = input.getAttribute("pattern");

                let currentInput = index;
                let pastedCount = 0;

                for (let i = 0; i < pastedValue.length; i++) {
                    const pastedCharacter = pastedValue.charAt(i);

                    if (
                        pastedCharacter.match(pattern) &&
                        currentInput < this.inputs.length
                    ) {
                        this.inputs[currentInput].value = pastedCharacter;
                        currentInput++;
                        pastedCount++;
                    }
                }

                const nextInput = this.inputs[currentInput];

                if (nextInput !== undefined) {
                    nextInput.focus();
                } else {
                    lastInput.focus();
                }

                this.updateHiddenField();

                this.inputs.forEach((input) => {
                    input.dispatchEvent(new Event("input", { bubbles: true }));
                });

                event.preventDefault();
            });
        });
    },

    updateHiddenField() {
        const inputValues = this.inputs.map((input) => input.value);
        this.hiddenField.value = inputValues.join("");
    },
};
