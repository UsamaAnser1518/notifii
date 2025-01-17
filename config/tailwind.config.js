// tailwind.config.js

module.exports = {
  purge: [],
  darkMode: "class", // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary: {
          50: "#F0F5FF",
          // Define other shades of primary color
        },
        // Define other custom colors
      },
      // Extend other theme settings
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
