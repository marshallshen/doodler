module Doodler
  class Strategy
    include ::ChunkyPNG::Color
    include Doodler::Notification

    attr_accessor :image

    def initialize(image)
      @image = image
    end

    def bubblize
      notify_start

      50000.times do
        centre = [rand(width), rand(height)] ; radius = rand(3)
        color = ChunkyPNG::Color(image[centre[0], centre[1]])

        left = [0, centre[0] - radius].max
        right = [centre[0] + radius, (width-1)].min
        up = [centre[1] + radius, (height-1)].min
        down = [0, centre[1] - radius].max

        (left..right).to_a.each do |x|
          (down..up).to_a.each do |y|
            image[x,y] = color if distance_from_centre(centre, x, y) <= radius
          end
        end

      end

      render
      notify_complete
    end

    def cubify
      # another method
    end

    def textify
      # another method
    end

    def render
      image.save("image/render/output.png")
    end

    private
    def height
      image.height
    end

    def width
      image.width
    end

    def distance_from_centre(centre, x, y)
      Math.sqrt(((x-centre[0])**2 + (y-centre[1])**2))
    end
  end
end
