export default {
  /**
   * Mounted hook.
   *
   * @returns {void}
   */
  mounted() {
    console.log("[moon-ds] Dropdown hook: mounted");
    if (!this.el || !this.el.querySelector("[data-moon-position]")) {
      console.log("[moon-ds] Dropdown hook: no dropdown element found");
      // If not found, disable the hook
      this.isDisabled = true;
      return;
    }

    // Set the initial values
    this.isDisabled = false;
    this.moonObserver = null;
  },

  /**
   * Updated hook.
   *
   * @returns {void}
   */
  updated() {
    console.log("[moon-ds] Dropdown hook: updated()", this.moonPosition());
    if (this.isDisabled) return;
    // if moon is open and has no listener, setup the listeners
    if (this.moonIsOpen() === true && this.moonHasListener() === false) {
      this.setupMoonListeners(this.moonDropdownElement());
    } else if (this.moonIsOpen() === false && this.moonHasListener() === true) {
      this.setupMoonListeners(null); // destroy the listeners
    }
  },

  /**
   * Return moon dropdown open state.
   *
   * @return {boolean}
   * @private
   */
  moonIsOpen() {
    if (this.el) {
      return this.el.dataset.moonOpen === "true";
    }
    return false;
  },

  /**
   * Return the moon element dropdown.
   *
   * @return {HTMLElement|null}
   * @private
   */
  moonDropdownElement() {
    if (!this.el) return null;
    return this.el.querySelector("[data-moon-position]");
  },

  /**
   * Return the moon observer.
   *
   * @return {boolean}
   * @private
   */
  moonHasListener() {
    return this.moonObserver !== null;
  },

  /**
   * Return the moon dropdown position.
   *
   * @return {Object}
   * @private
   * @property {string} position
   * @property {string[]} positionClasses
   * @property {string} reversePosition
   * @property {string[]} reversePositionClasses
   */
  moonPosition() {
    if (!this.moonDropdownElement())
      return {
        position: "",
        positionClasses: [],
        reversePosition: "",
        reversePositionClasses: [],
      };
    return {
      position: this.moonDropdownElement().dataset.moonPosition,
      positionClasses: this.moonGetClasses(
        this.moonDropdownElement().dataset.moonPositionClasses
      ),
      reversePosition: this.moonDropdownElement().dataset.moonReversedPosition,
      reversePositionClasses: this.moonGetClasses(
        this.moonDropdownElement().dataset.moonReversedClasses
      ),
    };
  },

  /**
   * Getter for the moon dropdown reversed state.
   *
   * @return {boolean}
   * @private
   */
  isReversed() {
    if (!this.moonDropdownElement) return false;
    return this.moonPosition().reversePositionClasses.every((cls) =>
      this.moonDropdownElement().classList.contains(cls)
    );
  },

  /**
   *  The observed listeners for the moon dropdown.
   *
   * @return {void}
   * @private
   */
  setupMoonListeners(element) {
    if (this.isDisabled) return;
    if (!element && this.moonHasListener() === true) {
      this.destroyMoonListeners();
      return;
    }
    if (this.moonObserver !== null) this.destroyMoonListeners();
    // Create the observer
    this.moonObserver = new IntersectionObserver(
      this.callbackMoonDropdownObserver.bind(this),
      this.moonObserverOptions
    );
    // Start observing the moon dropdown
    this.moonObserver.observe(element);
  },

  /**
   * Get the classes from a string.
   *
   * @param {string} cls
   * @return {string[]}
   * @private
   */
  moonGetClasses(cls) {
    if (!cls || typeof cls !== "string") {
      return [];
    }
    return cls
      .split(" ")
      .map((c) => c.trim())
      .filter((c) => c !== "");
  },

  /**
   * Reverse the moon dropdown position.
   *
   * @param {boolean} isOutside
   * @param {string} fromWithSide
   * @return {void}
   * @private
   */
  handleMoonPosition(isOutside, fromWithSide) {
    console.log("[moon-ds] _handleMoonPosition", isOutside, fromWithSide);
    // Checks if the moon dropdown element exists
    if (!this.moonDropdownElement || !this.moonDropdownElement().classList)
      return;

    if (
      isOutside &&
      this.moonPosition().reversePosition.includes(fromWithSide)
    ) {
      // In case comes from the same direction, do nothing
      return;
    }

    if (isOutside) {
      // Reverse the position
      if (!this.isReversed()) {
        this.removeClasses(this.moonPosition().positionClasses);
        this.addClasses(this.moonPosition().reversePositionClasses);
      }
    }
  },

  callbackMoonDropdownObserver(entries, _observer) {
    const entry = entries && entries[0];
    let fromWithSide = "bottom";
    const isOutside = !entry.isIntersecting;
    if (entry.boundingClientRect.top < 0) {
      fromWithSide = "top";
    }
    this.handleMoonPosition(isOutside, fromWithSide);
  },

  /**
   * Destroy the observed listeners for the moon dropdown.
   *
   * @return {void}
   * @private
   */
  destroyMoonListeners() {
    console.log("[moon-ds] _destroyMoonListeners");
    // Disconnect the observer if it exists
    if (this.moonObserver !== null) {
      this.moonObserver.disconnect();
      this.moonObserver = null;
    }
  },

  /**
   * Utils to add/remove classes
   *
   * @param {*} classes
   * @return {void}
   * @private
   */
  addClasses(classes) {
    this.moonDropdownElement().classList.add(...classes);
  },

  removeClasses(classes) {
    this.moonDropdownElement().classList.remove(...classes);
  },

  /**
   * Options for the observer
   * @see https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API#Intersection_observer_options
   * @type {Object}
   * @private
   */
  moonObserverOptions: {
    root: null,
    rootMargin: "0px",
    threshold: 1,
  },
};
