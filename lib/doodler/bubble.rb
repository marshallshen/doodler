module Doodler
  class Bubble
    PHASES = {
      :spray => Proc.new{@radius = 8; @bubbles_per_attempt = 5},
      :stretch => Proc.new{@radius = 4; @bubbles_per_attempt = 3},
      :clean => Proce.new{@radius = 2; @bubbles_per_attempt = 1}
    }.freeze

    attr_accessor :centre, :radius, :color, :bubbles_per_attempt
    def initialize(radius, centre, color, bubbles_per_attempt = 1)
      @radius = radius || 1
      @centre = centre
      @color = color
      raise "bubble not correctly set" unless (@centre && @color)
    end

    def fill_for(subject)
      left = [0, @centre[0] - @radius].max
      right = [@centre[0] + @radius, (subject.width-1)].min
      up = [@centre[1] + @radius, (subject.height-1)].min
      down = [0, @centre[1] - @radius].max
      (left..right).to_a.each do |x|
        (down..up).to_a.each do |y|
          subject[x,y] = @color if distance_from_center(x,y) <= @radius
        end
      end
      subject
    end
    
    private
    def distance_from_center(x, y)
      Math.sqrt(((x-@centre[0])**2 + (y-@centre[1])**2))
    end
  end
end
