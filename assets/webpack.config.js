const path = require('path');
const glob = require('glob');
const HardSourceWebpackPlugin = require('hard-source-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');

const entrypoints = require('./entrypoints.json') || {};

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    optimization: {
      minimizer: [
        new OptimizeCSSAssetsPlugin({}),
      ],
      runtimeChunk: 'single',
      chunkIds: 'natural',
      concatenateModules: true,
      splitChunks: {
        chunks: 'all',
        minChunks: 1,
        minSize: 0,
      },
    },
    entry: entrypoints,
    output: {
      filename: 'js/[id]-[contenthash].js',
      chunkFilename: 'js/[id]-[contenthash].js',
      path: path.resolve(__dirname, '../priv/static'),
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
          use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader', 'sass-loader'],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: 'css/[id]-[contenthash].css',
        chunkFilename: 'css/[id]-[contenthash].css',
      }),
      new ManifestPlugin({ fileName: 'manifest.json' }),
      new CopyWebpackPlugin([{ from: 'static/', to: './' }]),
    ].concat(devMode ? [new HardSourceWebpackPlugin()] : []),
  };
};
