module Doodler
  class Strategy
    include ::ChunkyPNG::Color

    attr_accessor :image

    def initialize(image)
      @image = image
    end

    def bubblize
      puts " Start drawing! #{self.class}:bubblize_start"
      size = 4 # default radius
      (1...height).to_a.each_slice(size) do |veritical|
        (1...width).to_a.each_slice(size) do |horizontal|
          left = horizontal.min; right = horizontal.max
          down = veritical.min; up = horizontal.max
          centre = [(left + right)/2 , (up + down)/2 ]
          color = image[(left + right)/2 , (up + down)/2]

          (left..right).to_a.each do |x|
            (down..up).to_a.each do |y|
              image[x, y] = color if distance_from_centre(centre, x, y) <= size
            end
            puts "bubblizing... I am at #{centre}.. \n"
          end

        end

        render(image)
      end

      puts " I am done! #{self.class}:bubblize_end"
    end

    def cubify
    end

    def textify
    end

    def render(image)
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
