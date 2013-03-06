require File.join(File.dirname(__FILE__), '/doodler/base')
require File.join(File.dirname(__FILE__), '/doodler/version')
require File.join(File.dirname(__FILE__), '/doodler/runner')
require File.join(File.dirname(__FILE__), '/doodler/strategy')
require File.join(File.dirname(__FILE__), '/doodler/bubble')
require File.join(File.dirname(__FILE__), '/doodler/tracker')
require 'chunky_png'

module Doodler
  NoImageFound = "Hmm, I didn't see any picture here.."
  ImageSizeInconsistency = "Oops, the two pictures have different sizes.."
  FailToImprove = "Hm, my doodling doesn't look like the picture you provided at all! Let me try again.."
  Exit = "I am done drawing. Go check out how I do!"

  TrackSize = 5 # determine how fast to draw
  CheckPoint = 10000 # determine how similar the output image should be

  def self.draw(image)
    Doodler::Runner.new(image).draw!
  end
end
