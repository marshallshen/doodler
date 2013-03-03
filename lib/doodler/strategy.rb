module Doodler
  class Strategy
    PHASES = {
      :spray => Proc.new{@radius = 8; @bubbles_per_attempt = 4},
      :stretch => Proc.new{@radius = 4; @bubbles_per_attempt = 2},
      :clean => Proc.new{@radius = 2; @bubbles_per_attempt = 1}
    }.freeze
    attr_accessor :baseline_image, :output_image, :height, :width, :phase 
    def initialize(options)
      @baseline_image = options[:baseline_image]
      @output_image = options[:output_image]
      @phase = phase
      @height = @baseline_image.height
      @width = @baseline_image.width
    end

    def bubblize
      instance_eval PHASES[@phase.to_sym]
      @bubbles_per_attempt.times do
        x = rand(@width); y = rand(@height); radius = @radius
        init_color = ChunkyPNG::Color(@baseline_image[x, y])
        centre = [x, y]
        @output_image = Doodler::Bubble.new(radius, centre, init_color).fill_for(@output_image)
      end
      return @output_image
    # rescue for debugging..
    rescue => e
      puts e.backtrace
      raise
    end

    def randomize
      # naive method
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

    def pixelize!(size=10)
      # stole the code from web,
      # great thanks to the genius who wrote this
      [[:row, height], [:column, width]].each do |orientation, length|
        for i in 0...length
          pixelated = []; subject.send(orientation, i).each_slice(size) do |slice|
            pixelated += [ChunkyPNG::Color.rgba(*[:r,:g,:b,:a].map{|chan| 
              (slice.map{|c| ChunkyPNG::Color.send(chan, c)}.inject(0.0){|sum, v| sum += v} / slice.length).round
            })] * slice.length
          end
          subject.send("replace_#{orientation}!", i, pixelated)
        end
      end
    end
  end
end
