module.exports= (config)->
  config.set
    frameworks: ["mocha"]
    browsers: ["PhantomJS"]
    files: [
      "./test.coffee"
    ]
    preprocessors:
      "./test.coffee": ["webpack"]
    webpack: require "./webpack.config.coffee"
