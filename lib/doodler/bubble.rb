module Doodler
  class Bubble
    attr_accessor :centre, :radius, :color
    def intialize(options)
      @radius = options[:raius] || 1
      @centre = options[:centre]
      @color = options[:color]
      raise "bubble not correctly set" unless @centre && @color
    end

    def increase
      @radius = @radius*2
    end
    
    def decrease
      @radius = @radius/2
    end

    def fill_for(subject)
      # TODO: puzzle to solve
      # how to fill the color for a circle??
      subject
    end
  end
end
