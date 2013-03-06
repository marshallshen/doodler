require "bundler/gem_tasks"
require "chunky_png"
require "lib/doodler"

task :draw do
  raise "Oops, I don't see any image specified.." unless ENV["IMAGE_PATH"]
  image_path = ENV["IMAGE_PATH"]
  picture = ChunkyPNG::Image.from_file(image_path)
  Doodler.draw(picture)
end
