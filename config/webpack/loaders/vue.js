const { VueLoaderPlugin } = require('vue-loader')
module.exports = {
  mode: 'development',
  entry: [
    './src/packs/application.js'
  ],
  module: {
    rules: [{
      test: /\.vue$/,
      use: 'vue-loader'
    }]
  },
  plugins: [
    new VueLoaderPlugin()
  ]
}

// module.exports = {
//   test: /\.vue(\.erb)?$/,
//   use: [{
//     loader: 'vue-loader'
//   }]
// }
