module Doodler
  class Strategy
    include Doodler::Notification

    attr_accessor :image

    def initialize(image)
      @image = image
    end

    def bubblize
      notify_start

      50000.times do
        centre = [rand(width), rand(height)] ; radius = rand(5)
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
      notify_start

      50000.times do
        start = [rand(width), rand(height)] ; size = rand(5)
        color = ChunkyPNG::Color(image[start[0], start[1]])

        left = start[0]
        right = [(start[0]+size), width-1].min
        up = [(start[1]+size), height-1].min
        down = start[1]

        (left..right).to_a.each do |x|
          (down..up).to_a.each do |y|
            image[x,y] = color
          end
        end

      end

      render

      notify_complete
    end

    def textify
      # another method
    end

    private
    def render
      image.save("image/render/output.png")
    end
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
