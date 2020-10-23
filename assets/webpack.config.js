const path = require('path');
const { ProvidePlugin } = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const entrypoints = require('./entrypoints.json') || {};

const rootSourcePaths = [];

const cwd = process.cwd();

const checkRootPath = fallback => src => {
  const relativePath = path.relative(cwd, src);
  for (let i in rootSourcePaths) {
    const rootPath = rootSourcePaths[i];
    if (relativePath.startsWith(rootPath)) {
      return path.relative(rootPath, src);
    }
  }
  return fallback;
};

if (Object.keys(entrypoints).length === 0) {
  console.log('No entrypoints');
  process.exit();
  return;
}

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      // new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ],
    runtimeChunk: 'single',
    chunkIds: 'natural',
    concatenateModules: true,
    splitChunks: {
      chunks: 'all',
      minChunks: 1,
      minSize: 0
    }
  },
  entry: entrypoints,
  output: {
    filename: '[id]-[contenthash].js',
    chunkFilename: '[id]-[contenthash].js',
    path: path.resolve(__dirname, '../priv/static/assets')
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '[id]-[contenthash].css',
      chunkFilename: '[id]-[contenthash].css',
    }),
    new CopyWebpackPlugin([{ from: 'static/', to: './' }]),
    new ManifestPlugin({ fileName: '../manifest.json' }),
    new CleanWebpackPlugin(),
    new ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery'
    })
  ],
  stats: {
    warnings: false
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.(scss|css)$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', {
          loader: 'sass-loader',
          options: {
            sassOptions: {
              includePaths: ['./node_modules']
            }
          }
        }]
      },
      {
        test: /\.(png|jpg|gif|ico)(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader',
        options: {
          name: checkRootPath('img/[name].[ext]')
        }
      },
      {
        test: /\.(eot|com|json|ttf|woff|woff2)(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader',
        options: {
          name: checkRootPath('fonts/[name].[ext]')
        }
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file-loader',
        options: {
          name: checkRootPath('svg/[name].[ext]')
        }
      }
    ]
  }
});