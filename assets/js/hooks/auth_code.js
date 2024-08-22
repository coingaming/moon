export default {
    mounted() {
        this.inputs = Array.from(
            this.el.querySelectorAll('input:not([type="hidden"])')
        );
        this.hiddenField = this.el.querySelector('input[type="hidden"]');
        this.inputValues = this.inputs.map((input) => input.value);

        // TODO: add support forms with re-render on "phx-change" event 
        this.hasFocusJump = !this.el.closest("form[phx-change]");
        
        this.handleOnChange();
        this.handleOnKeydown();
        this.handleOnPaste();
    },

    handleOnChange() {
        this.inputs.forEach((input, index) => {
            input.addEventListener("input", (event) => {
                console.log(`Input event triggered on input index: ${index}`);

                const value = event.target.value;
                console.log(`Current input value: "${value}"`);

                const nextInput = this.inputs[index + 1];
                console.log(`Next input index: ${index + 1}`);

                const pattern = input.getAttribute("pattern");
                console.log(`Pattern for input: "${pattern}"`);

                if (value.length > 1) {
                    console.log(`Value length is greater than 1, truncating to first character`);
                    event.target.value = value.charAt(0);
                    if (nextInput !== undefined && this.hasFocusJump) {
                        console.log(`Focusing next input index: ${index + 1}`);
                        nextInput.focus();
                    } else {
                        console.log(`No next input to focus or hasFocusJump is false`);
                    }
                } else if (value.match(new RegExp(pattern, "gi"))) {
                    console.log(`Value matches the pattern`);
                    if (nextInput !== undefined && this.hasFocusJump) {
                        console.log(`Focusing next input index: ${index + 1}`);
                        nextInput.focus();
                    } else {
                        console.log(`No next input to focus or hasFocusJump is false`);
                    }
                } else {
                    console.log(`Value does not match the pattern, clearing input`);
                    event.target.value = "";
                }

                event.preventDefault();
                console.log(`Default action prevented`);

                this.updateHiddenField();
                console.log(`Hidden field updated`);
            });
        });
    },

    handleOnKeydown() {
        this.inputs.forEach((input, index) => {
            input.addEventListener("keydown", (event) => {
                const prevInput = this.inputs[index - 1];

                if (event.key === "Backspace" && this.hasFocusJump) {
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
                console.log(`Paste event triggered on input index: ${index}`);

                const count = this.inputs.length - 1;
                const lastInput = this.inputs[count];

                const pastedValue = event.clipboardData.getData("Text");
                console.log(`Pasted value: "${pastedValue}"`);

                const pattern = input.getAttribute("pattern");
                console.log(`Pattern for input: "${pattern}"`);

                let currentInput = index;
                let pastedCount = 0;

                for (let i = 0; i < pastedValue.length; i++) {
                    const pastedCharacter = pastedValue.charAt(i);
                    console.log(`Processing character: "${pastedCharacter}"`);

                    if (
                        pastedCharacter.match(pattern) &&
                        currentInput < this.inputs.length
                    ) {
                        this.inputs[currentInput].value = pastedCharacter;
                        console.log(`Assigned character "${pastedCharacter}" to input index: ${currentInput}`);
                        currentInput++;
                        pastedCount++;
                    }
                }

                const nextInput = this.inputs[currentInput];
                if (nextInput !== undefined) {
                    console.log(`Focusing next input index: ${currentInput}`);
                    nextInput.focus();
                } else {
                    console.log(`No more inputs to focus. Focusing last input index: ${count}`);
                    lastInput.focus();
                }

                this.updateHiddenField();
                console.log("Hidden field updated");

                this.hiddenField.dispatchEvent(
                    new Event("input", { bubbles: true })
                );
                console.log("Dispatched 'input' event on hidden field");

                event.preventDefault();
            });
        });
    },

    updateHiddenField() {
        const inputValues = this.inputs.map((input) => input.value);
        this.hiddenField.value = inputValues.join("");
    },
};
