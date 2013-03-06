module Doodler
  class Strategy
    PHASES = {
      :spray => Proc.new{@radius = 8; @bubble_per_attempt = 4},
      :stretch => Proc.new{@radius = 4; @bubble_per_attempt = 2},
      :clean => Proc.new{@radius = 2; @bubble_per_attempt = 1},
      :decorate => Proc.new{@radius = 8; @bubble_per_attempt = 2}
    }.freeze

    attr_accessor :baseline_image, :output_image, :height, :width, :phase 
    def initialize(options)
      @baseline_image = options[:baseline_image]
      @output_image = options[:output_image]
      @phase = options[:phase]
      @height = @baseline_image.height
      @width = @baseline_image.width
    end

    def bubblize
      instance_exec &PHASES[@phase.to_sym]
      @bubble_per_attempt.times do
        centre = init_centre; x = centre[0]; y = centre[1]
        raise Doodler::Exit unless centre
        init_color = ChunkyPNG::Color(@baseline_image[x, y])
        @output_image = Doodler::Bubble.new(@radius, centre, init_color).fill_for(@output_image)
      end
      return @output_image
    end

    private
    def init_centre
      if @phase.to_sym == :decorate
        (0..(@width -1)).each do |x|
          (0..(@height -1)).each do |y|
            return [x, y] if @output_image[x,y] == ChunkyPNG::Color::WHITE
          end
        end
      else
        [rand(@width), rand(@height)]
      end
    end
  end
end
