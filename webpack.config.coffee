_= require "underscore"

module.exports=
  entry: "./test.coffee"
  output: filename: "test.js"
  module:
    rules:_.values
      Js:
        test: /\.js$/, loader: "babel-loader", exclude: /node_modules/, options: presets: ["env"]
      Coffee:
        test: /\.coffee$/, exclude: /node_modules/, use:[
          {loader: "babel-loader", options: presets: ["env"]}
          {loader: "coffee-loader"}
        ]
