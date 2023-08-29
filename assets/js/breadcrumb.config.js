module.exports = {
    tailwindClassesBreadcrumb: () => {
      return ["sm", "md", "lg", "xl", "2xl"].map(size => {
        //options
        return ["hidden", "inline"].map(cls => [size, cls].join(':'))
      }).flat()
    }
  }