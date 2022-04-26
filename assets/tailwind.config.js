const plugin = require('tailwindcss/plugin')

module.exports = {
  content: [
    '../lib/**/*.ex',
    '../lib/**/*.heex',
    '../lib/**/*.eex',
    './js/**/*.js',
  ],
  theme: {
    extend: {
      fontSize: {
        xxxs: '.5rem', // 8px
        xxs: '.625rem', // 10px
      },
      padding: {
        '4.5': '1.125rem'
      },
      width: {
        '25': '6.25rem', // 100px
        '50': '12.5rem',
        '80': '20rem',
        '96': '24rem',
        '128': '32rem'
      },
      height: {
        '25': '6.25rem', // 100px
        '80': '20rem',
        '96': '24rem',
      },
      opacity: {
        'disabled': 'var(--opacity--disabled)'
      }
    },
    fontWeight: {
      normal: 400,
      semibold: 500
    },
    boxShadow: {
      sm: 'var(--box-shadow--sm)',
      DEFAULT: 'var(--box-shadow--default)',
      md: 'var(--box-shadow--default)',
      lg: 'var(--box-shadow--lg)',
      xl: 'var(--box-shadow--xl)',
    },
    borderRadius: {
      sm: 'var(--radius--small)',
      DEFAULT: 'var(--radius--default)',
      md: 'var(--radius--medium)',
      lg: 'var(--radius--large)',
      xl: 'var(--radius--xlarge)',
      full: '99%'
    },
    colors: {
      transparent: 'transparent',
      text: 'var(--color-text)',
      background: 'var(--color-background)',
      'krillin-10': 'var(--color--krillin-10)',
      'krillin-60': 'var(--color--krillin-60)',
      'krillin-100': 'var(--color--krillin-100)',
      'chi-chi-10': 'var(--color--chi-chi-10)',
      'chi-chi-60': 'var(--color--chi-chi-60)',
      'chi-chi-100': 'var(--color--chi-chi-100)',
      'roshi-10': 'var(--color--roshi-10)',
      'roshi-60': 'var(--color--roshi-60)',
      'roshi-100': 'var(--color--roshi-100)',
      'dodoria-10': 'var(--color--dodoria-10)',
      'dodoria-60': 'var(--color--dodoria-60)',
      'dodoria-100': 'var(--color--dodoria-100)',
      'cell-10': 'var(--color--cell-10)',
      'cell-60': 'var(--color--cell-60)',
      'cell-100': 'var(--color--cell-100)',
      'raditz-10': 'var(--color--raditz-10)',
      'raditz-60': 'var(--color--raditz-60)',
      'raditz-100': 'var(--color--raditz-100)',
      'whis-10': 'var(--color--whis-10)',
      'whis-60': 'var(--color--whis-60)',
      'whis-100': 'var(--color--whis-100)',
      'frieza-10': 'var(--color--frieza-10)',
      'frieza-60': 'var(--color--frieza-60)',
      'frieza-100': 'var(--color--frieza-100)',
      'nappa-10': 'var(--color--nappa-10)',
      'nappa-60': 'var(--color--nappa-60)',
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
      'goku-120': 'var(--color--goku-120)',
      'gohan-10': 'var(--color--gohan-10)',
      'gohan-40': 'var(--color--gohan-40)',
      'gohan-80': 'var(--color--gohan-80)',
      'gohan-100': 'var(--color--gohan-100)',
      'gohan-120': 'var(--color--gohan-120)',
      'beerus-100': 'var(--color--beerus-100)',
      'bulma-100': 'var(--color--bulma-100)',
      'trunks-100': 'var(--color--trunks-100)',
      black: "#000",
      hover: 'rgba(34, 34, 37, 0.12)',
      'primary-hover': 'rgba(0, 0, 0, 0.08)'
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    plugin(({ addUtilities }) => {
      addUtilities({})
    })
  ],
};
