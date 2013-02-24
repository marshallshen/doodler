require "bundler/gem_tasks"
task :draw do
  raise "Oops, I don't see any image specified.." unless ENV["IMAGE_PATH"]
  image_path = ENV["IMAGE_PATH"]
  picture = ChunkyPNG::Image.from_file(image_path)
  Doodler.draw(picture)
end
