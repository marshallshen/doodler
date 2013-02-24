require File.join(File.dirname(__FILE__), '/doodler/base')
require File.join(File.dirname(__FILE__), '/doodler/version')
require File.join(File.dirname(__FILE__), '/doodler/runner')
require File.join(File.dirname(__FILE__), '/doodler/strategy')
require File.join(File.dirname(__FILE__), '/doodler/pixelizer')
require 'chunky_png'

module Doodler
  NoImageFound = "Hmm, I didn't see any picture here.."
  ImageSizeInconsistency = "Oops, the two pictures have different sizes.."
  FailToImprove = "Ah, my doodling doesn't look like the picture you provided at all! Let me try again.."

  def self.draw(image=nil)
    unless image
      image_path = File.join(File.dirname(__FILE__), '../image/baseline/baseline_1.png')
      image = ChunkyPNG::Image.from_file(image_path)
    end
    Doodler::Runner.new(image).draw!
  end
end
