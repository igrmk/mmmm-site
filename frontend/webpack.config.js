const path = require('node:path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const FaviconsWebpackPlugin = require('favicons-webpack-plugin')

module.exports = {
    mode: 'production',
    entry: './src/index.js',
    output: {
        filename: 'index.js',
        path: path.resolve(__dirname, 'dist'),
    },
    module: { rules: [{ test: /\.css$/, use: ['style-loader', 'css-loader'] }] },
    plugins: [
        new HtmlWebpackPlugin({
            filename: 'index.html',
            template: 'src/index.html',
            minify: true,
        }),
        new FaviconsWebpackPlugin({
            logo: 'src/favicon.svg',
            favicons: {
                background: 'transparent',
            },
        }),
    ],
}
