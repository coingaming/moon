module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    './js/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontSize: {
        'xxs': '.625rem'
      }
      // width: {
      //   '66': '66px',
      //   '88': '88px',
      // },
      // height: {
      //   '66': '66px',
      //   '88': '88px',
      // }
    },
    boxShadow: {
      DEFAULT: '0px 0.3px 0.9px rgba(0, 0, 0, 0.1), 0px 24px 24px -6px rgba(0, 0, 0, 0.1)',
      lg: '0px 8px 24px -6px rgba(0, 0, 0, 0.16), 0px 0px 1px rgba(0, 0, 0, 0.4)',
      xl: '0px 32px 32px -8px rgba(0, 0, 0, 0.08), 0px 0px 32px -8px rgba(0, 0, 0, 0.12), 0px 0px 1px rgba(0, 0, 0, 0.2)'
    },
    colors: {
      'transparent': 'transparent',
      'text': 'var(--color-text)',
      'background': 'var(--color-background)',
      'krillin-10': 'var(--color--krillin-10)',
      'krillin-100': 'var(--color--krillin-100)',
      'chi_chi-10': 'var(--color--chi_chi-10)',
      'chi_chi-100': 'var(--color--chi_chi-100)',
      'roshi-10': 'var(--color--roshi-10)',
      'roshi-100': 'var(--color--roshi-100)',
      'dodoria-10': 'var(--color--dodoria-10)',
      'dodoria-100': 'var(--color--dodoria-100)',
      'dodoria-100': 'var(--color--cell-10)',
      'cell-100': 'var(--color--cell-100)',
      'raditz-10': 'var(--color--raditz-10)',
      'raditz-100': 'var(--color--raditz-100)',
      'whis-10': 'var(--color--whis-10)',
      'whis-100': 'var(--color--whis-100)',
      'frieza-10': 'var(--color--frieza-10)',
      'frieza-100': 'var(--color--frieza-100)',
      'nappa-10': 'var(--color--nappa-10)',
      'nappa-100': 'var(--color--nappa-100)',
      'piccolo-80': 'var(--color--piccolo-80)',
      'piccolo-100': 'var(--color--piccolo-100)',
      'piccolo-120': 'var(--color--piccolo-120)',
      'hit-80': 'var(--color--hit-80)',
      'hit-100': 'var(--color--hit-100)',
      'hit-120': 'var(--color--hit-120)',
      'goten-100': 'var(--color--goten-100)',
      'goku-10': 'var(--color--goku-10)',
      'goku-40': 'var(--color--goku-40)',
      'goku-80': 'var(--color--goku-80)',
      'goku-100': 'var(--color--goku-100)',
      'gohan-10': 'var(--color--gohan-10)',
      'gohan-40': 'var(--color--gohan-40)',
      'gohan-80': 'var(--color--gohan-80)',
      'gohan-100': 'var(--color--gohan-100)',
      'beerus-100': 'var(--color--beerus-100)',
      'bulma-100': 'var(--color--bulma-100)',
      'trunks-100': 'var(--color--trunks-100)',
      'hover': 'rgba(0, 0, 0, 0.08)'
    },
  },
  variants: {
    width: ['responsive', 'hover', 'focus']
  },
  plugins: [
    require('@tailwindcss/aspect-ratio')
  ],
};
