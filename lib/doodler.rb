require File.join(File.dirname(__FILE__), '/doodler/version')
require File.join(File.dirname(__FILE__), '/doodler/runner')
require File.join(File.dirname(__FILE__), '/doodler/strategy')
require 'chunky_png'
require 'pry'

module Doodler
  NoImageFound = "Hmm, I didn't see any picture here.."
  ImageSizeInconsistency = "Oops, the two pictures have different sizes.."
  FailToImprove = "Hm, my doodling doesn't look like the picture you provided at all! Let me try again.."
  Exit = "I am done drawing. Go check out how I do!"

  def self.draw(image, strategy)
    raise Doodler::NoImageFound unless image
    Doodler::Runner.draw!(image, strategy)
  end
end
