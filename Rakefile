require "bundler/gem_tasks"
require "chunky_png"
require File.join(File.dirname(__FILE__), 'lib', 'doodler')

task :draw do
  image_path = ENV["IMAGE_PATH"]
  strategy = ENV["STRATEGY"]

  image = ChunkyPNG::Image.from_file(image_path)
  Doodler.draw(image, strategy)
end
