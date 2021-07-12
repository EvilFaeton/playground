module.exports = {
  "*.{js,jsx}": ["prettier --write", "eslint"],
  "*.{ts,tsx}": [
    "prettier --parser typescript --write",
    "eslint --parser @typescript-eslint/parser",
  ],
  "*.{css,scss}": ["prettier --parser css --write"],
  "*.graphql": [
    "prettier --parser graphql --write"
  ],
};
