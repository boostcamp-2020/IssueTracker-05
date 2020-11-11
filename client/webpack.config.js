const path = require('path');
const HtmlWebPackPlugin = require('html-webpack-plugin');

module.exports = {
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'bundle.js',
  },
  resolve: {
    modules: [path.join(__dirname, 'src'), 'node_modules'],
    alias: {
      react: path.join(__dirname, 'node_modules', 'react'),
      '@components': path.join(__dirname, 'src/components'),
      '@constants': path.join(__dirname, 'src/constants'),
      '@lib': path.join(__dirname, 'src/lib'),
      '@pages': path.join(__dirname, 'src/pages'),
      '@system': path.join(__dirname, 'src/system'),
      '@utils': path.join(__dirname, 'src/utils'),
      '@atoms': path.join(__dirname, 'src/components/atoms'),
      '@molecules': path.join(__dirname, 'src/components/molecules'),
      '@organisms': path.join(__dirname, 'src/components/organisms'),
      '@templates': path.join(__dirname, 'src/components/templates'),
    },
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.css$/,
        use: [
          {
            loader: 'style-loader',
          },
          {
            loader: 'css-loader',
          },
        ],
      },
      {
        test: /\.svg$/,
        use: ['@svgr/webpack'],
      },
    ],
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: './src/index.html',
    }),
  ],
};
