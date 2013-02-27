module Doodler
  class Strategy
    attr_accessor :subject, :height, :width 
    def initialize(subject)
      @subject = subject
      @height = subject.height
      @width = subject.width
    end

    def bubblize
      bubble_hash = {}
      centre = [rand(width), rand(height)]
      color = ChunkyPNG::Color.rgba(rand(256), rand(256), rand(256), rand(256))
      radius = 5
      
      # TODO: refactor bubble construction
      [center, color, radius].each {|attr| bubble_hash[attr.to_sym] = attr}
 
      bubble = Doodle::Bubble.new(bubble_hash)

      subject = bubble.fill_for(subject)
    end

    def randomize
      # The method doesn't work well..
      # The algorithm is not learning from the mistakes
      start_width = rand(width)
      start_height = rand(height)
      color = ChunkyPNG::Color.rgba(rand(256), rand(256), rand(256), rand(256))
      horizontal = rand(width/2)
      vertical = rand(height/2)

      left_bound_horizontal = [(start_width - horizontal), 0].max
      right_bound_horizontal = [(start_width + horizontal), (start_width-1)].min

      left_bound_vertical = [(start_height - vertical), 0].max
      right_bound_vertical = [(start_height + vertical), (start_height-1)].min
      for x in (left_bound_horizontal..right_bound_horizontal)
        for y in (left_bound_vertical..right_bound_vertical)
          subject[x, y] = color
        end
      end
      subject
    end
  end
end
