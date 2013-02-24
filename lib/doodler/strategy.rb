module Doodler
  class Strategy
    attr_accessor :subject, :height, :width
    def initialize(subject)
      @subject = subject
      @height = subject.height
      @width = subject.width
    end

    def randomized
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
