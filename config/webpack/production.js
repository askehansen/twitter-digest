process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

/*
  config/webpack/environment.js
  PurgeCSS configuration for Rails 5 + Webpacker + Tailwind CSS + Vue.js
  Optionally, put this in production.js if you only want this to apply to production.
  For example, your app is large and you want to optimize dev compilation speed.
*/

const path = require('path')
const PurgecssPlugin = require('purgecss-webpack-plugin')
const glob = require('glob-all')



// // ensure classes with special chars like -mt-1 and md:w-1/3 are included
// class TailwindExtractor {
//   static extract(content) {
//     return content.match(/[A-z0-9-:/]+/g);
//   }
// }
//
// environment.plugins.append('PurgecssPlugin', new PurgecssPlugin({
//   paths: glob.sync([
//     path.join(__dirname, '../../app/views/**/*.slim'),
//     path.join(__dirname, '../../app/views/**/*.erb'),
//     path.join(__dirname, '../../app/decorators/**/*.rb'),
//     path.join(__dirname, '../../app/helpers/**/*.rb'),
//     path.join(__dirname, '../../app/javascript/**/*.js'),
//     path.join(__dirname, '../../app/assets/javascripts/**/*.js'),
//   ]),
//   extractors: [ // if using Tailwind
//     {
//       extractor: TailwindExtractor,
//       extensions: ['slim', 'js', 'erb', 'rb']
//     }
//   ]
// }));



module.exports = environment.toWebpackConfig()
