module.exports = {
  theme: {
    extend: {
      fontSize: {
        '7xl': '5rem'
      },
      colors: {
        'yellow': {
          100: '#FFFCED',
          200: '#FFF7D1',
          300: '#FFF1B5',
          400: '#FFE77E',
          500: '#FFDD46',
          600: '#E6C73F',
          700: '#99852A',
          800: '#736320',
          900: '#4D4215',
          },
      },
      fontFamily: {
        serif: [
          'Sapien',
          'Georgia',
          'Cambria',
          'Times New Roman',
          'Times',
          'serif',
        ]
      }
    },
  },
  variants: {
    opacity: ['responsive', 'hover', 'focus', 'group-hover'],
    display: ['responsive', 'hover', 'focus', 'group-hover'],
  },
  plugins: [
    require('@tailwindcss/custom-forms')
  ],
  purge: {
    // enabled: true,
    content: [
      './app/**/*.html.*',
      './app/**/*.js',
      './app/components/**/*.rb',
    ]
  }
}
