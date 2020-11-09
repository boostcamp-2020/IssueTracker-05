const path = require('path');

module.exports = {
  "stories": [
    "../src/**/*.stories.mdx",
    "../src/**/*.stories.@(js|jsx|ts|tsx)"
  ],
  "addons": [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    '@storybook/addon-controls',
    "@storybook/addon-knobs",
  ],
  webpackFinal: async (config, { configType }) => {
    config.resolve.alias = {
      ...config.resolve.alias,
      '@hooks': path.join(__dirname, '../src/hooks'),
      '@atoms': path.join(__dirname, '../src/components/atoms'),
      '@molecules': path.join(__dirname, '../src/components/molecules'),
      '@organisms': path.join(__dirname, '../src/components/organisms'),
      '@templates': path.join(__dirname, '../src/components/templates'),
      '@pages': path.join(__dirname, '../src/components/pages'),
    };
    return config;
  },
}