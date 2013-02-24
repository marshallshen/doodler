module Doodler
  class Base
    include ::ChunkyPNG::Color
    attr_accessor :baseline_image, :output_image, :diff, :attempts

    def initialize(image)
      raise Doodler::NoBaselineImageFound unless image
      @baseline_image = image
      @output_image = ChunkyPNG::Image.new(image.width, image.height, WHITE)
      @diff = difference(@output_image, @baseline_image)
      @attempts = 0
    end
  end
end
