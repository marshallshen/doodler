module Doodler
  class Base
    include ::ChunkyPNG::Color
    attr_accessor :baseline_image, :output_image, :diffs, :attempts

    def initialize(image, output_image = nil)
      raise Doodler::NoImageFound unless image
      @baseline_image = image
      @output_image = output_image || ChunkyPNG::Image.new(image.width, image.height, WHITE)
      @diffs = Doodler::Tracker.new(difference(@output_image, @baseline_image))
      @attempts = 0
    end

    def difference(image_1, image_2)
      total_score = 0
      raise Doodler::ImageSizeInconsistency unless (image_1.height == image_2.height && image_1.width == image_2.width)
      for w in 1..(image_1.width-1)
        for h in 1..(image_1.height-1)
          total_score += formula(image_1[w,h], image_2[w,h])
        end
      end
      diff = total_score
    end

    def formula(pixel_1, pixel_2)
      score =  Math.sqrt(
        (r(pixel_1) - r(pixel_2)) ** 2 +
        (g(pixel_1) - g(pixel_2)) ** 2 +
        (b(pixel_1) - b(pixel_2)) ** 2
      ) / Math.sqrt(MAX ** 2 * 3)
    end
  end
end
