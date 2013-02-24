module Doodler
  class Runner
    include ::ChunkyPNG::Color
    attr_accessor :baseline_image, :output_image, :diff, :attempts

    def initialize(image)
      raise Doodler::NoBaselineImageFound unless image
      @baseline_image = image
      @output_image = ChunkyPNG::Image.new(image.width, image.height, WHITE)
      @diff = difference(@output_image, @baseline_image)
      @attempts = 0
    end

    def draw
      while @diff >= 10000
        adjust
        render
      end
      close
    end

    def render
      # need a better metadata, write it this way
      # this is pure laziness..
      @output_image.save("image/render/#{Time.now.to_i}.png")
    end

    def close
      puts "I am done doodling! Go check out how I do! \n"
      @attempts = 0
    end

    def notify
      puts "Doodler is drawing, attempt #{@attempts}, difference: #{@diff}---------\n"
    end

    def adjust
      notify
      adjusted_image = Doodler::Strategy.new(@output_image).randomized
      new_diff = difference(adjusted_image, @baseline_image) 
      raise Doodler::FailToImprove if new_diff >= @diff
      @diff = new_diff
      @output_image = adjusted_image
      @attempts += 1
    rescue Exception => e
      puts e.message
      retry
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
