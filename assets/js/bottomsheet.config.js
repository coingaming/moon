module.exports = {
  tailwindClassesBottomsheet: () => {
    return ["sm", "md", "lg", "xl", "2xl"].map(size => {
      //panel
      return ["max-w-sm", "inline-block", "rounded-xl", "align-middle", "shadow-moon-lg", "bottom-auto", "inset-x-auto",
      //container
      "hidden", "flex", "items-center", "justify-center"].map(cls => [size, cls].join(':'))
    }).flat()
  }
}