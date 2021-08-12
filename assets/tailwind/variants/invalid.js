module.exports = function ({ addVariant, e }) {
  addVariant('invalid', ({ modifySelectors, separator }) => {
    modifySelectors(({ className }) => {
      return `.${e(`invalid${separator}${className}`)}:invalid`;
    });
  });
};
