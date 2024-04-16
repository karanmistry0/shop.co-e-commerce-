/** @type {import('tailwindcss').Config} */
const colors = require("tailwindcss/colors");
module.exports = {
  content: ["./app/**/*.{html,js,erb}"],
  theme: {
    colors: {
      ...colors,
      primary: {
        DEFAULT: '#f2f0f1',
      }
    },
    extend: {},
  },
  plugins: [],
}

