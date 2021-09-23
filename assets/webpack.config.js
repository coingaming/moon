const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const entrypoints = require('./entrypoints.json') || {};

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    optimization: {
      minimizer: [
        new OptimizeCSSAssetsPlugin({}),
      ]
    },
    entry: entrypoints,
    output: {
      filename: 'js/[name].js',
      path: path.resolve(__dirname, '../priv/static')
    },
    devtool: devMode ? 'eval-cheap-module-source-map' : undefined,
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
          },
        },
        {
          test: /\.[s]?css$/,
          use: [
            MiniCssExtractPlugin.loader,
            'css-loader',
            'postcss-loader',
            'sass-loader'
          ],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: 'css/[name].css' }),
      new CopyWebpackPlugin([{ from: 'static/', to: './' }]),
    ],
  };
};
