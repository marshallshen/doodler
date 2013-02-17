module Doodler
  class Polygon
    attr_accessor :points, :red, :green, :blue, :alpha
    def initialize
      @points = []
      3.times {add_point}
      [:red, :green, :blue, :alpha].each {|method| send("#{method}=", rand(256))}
    end

    def add_point
      case points.size
      when 0
        @points << [rand(Doodler::CANVAS_WIDTH, Doodler::CANVAS_LENGTH)]
      when 1
        (rand(2) == 1) ? second_point( @points.first, Doodler::RADIUS) : second_point( @points.first, -Doodler::RADIUS) 
      when 2
        (rand(2) == 1) ? third_point( @points, Doodler::RADIUS) : next_point( @points, -Doodler::RADIUS)
      else
      end
    end

    private
    def same_point?(point_1, point_2)
      point_1[0] == point_2[0] && point_1[1] == point_2[1]
    end

    def same_line?(point_1, point_2, point_3)
      ( point_1[0] == point_2[0] && point_1[2] == point_3[0] ) ||
      ( point_1[1] == point_2[1] && point_2[1]== point_3[1] )
    end

    def second_point(initial_point, radius)
      x = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_WIDTH)
      y = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_LENGTH)
      if same_point?(initial_point, [x, y])
        retry
      else
        @points << [x, y]
      end
    end
  
    def third_point(points, radius)
      x = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_WIDTH)
      y = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_LENGTH)
      if same_point?(points.first, [x, y]) || same_point?(points.second, [x, y]) || same_line?(points.first, points.second, [x, y])
        retry
      else
        @points << [x, y]
      end
    end

    def next_point(points, radius)
      # YUCKS..REFACTOR!
      x = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_WIDTH)
      y = min(max(initial_point + rand(radius), 0), Doodler::CANVAS_LENGTH)
      repeated = points.each do |point|
        if same_point?(point, [x, y])
          return true
        else
          next
        end
        return false
      end
      if repeated
        retry
      else
        @points << [x, y]
      end
    end
  end
end
