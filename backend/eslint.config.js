const js = require("@eslint/js");
const globals = require("globals");

module.exports = [
  {
    ignores: ["node_modules/**", "coverage/**"],
  },

  js.configs.recommended,

  {
    files: ["**/*.js"],

    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "commonjs",

      globals: {
        ...globals.node,
      },
    },

    rules: {
      "no-unused-vars": "warn",
      "no-console": "off",
    },
  },

  {
    files: [
      "**/*.test.js",
      "**/*.spec.js",
      "test/**/*.js",
      "tests/**/*.js",
    ],

    languageOptions: {
      globals: {
        ...globals.jest,
      },
    },
  },
];
