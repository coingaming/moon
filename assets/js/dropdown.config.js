module.exports = {
    tailwindClassesDropdown: () => {
      return ["sm", "md", "lg", "xl", "2xl"].map(size => {
        //options
        return ["absolute", "z-[99]", "rounded-moon-s-md", "my-2", "shadow-moon-lg", "bottom-auto", "top-full"].map(cls => [size, cls].join(':'))
      }).flat()
    }
  }