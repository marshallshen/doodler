module Doodler
  class Runner < Base
    def draw!
      while @diffs.queue.last >= Doodler::CheckPoint
        adjust
        render
      end
      close
    end

    def render
      @output_image.save("image/render/output.png")
    end

    def close
      puts "I am done doodling! Go check out how I do! \n"
      @attempts = 0
    end

    def notify
      puts "Doodler is drawing, attempt #{@attempts}, difference: #{@diffs.queue.first}, technique: #{phase}---------\n"
    end

    def phase
      Doodler::Tracker.track_phase(@diffs.queue)
    end

    def perception
      {:baseline_image => @baseline_image,
       :output_image => @output_image,
       :phase => phase }
    end

    def adjust
      notify
      strategy = Doodler::Strategy.new(perception.to_hash)
      adjusted_image = strategy.bubblize
      new_diff = difference(adjusted_image, @baseline_image) 
      raise Doodler::FailToImprove if new_diff >= @diffs.queue.last
      @diffs.enqueue(new_diff)
      @output_image = adjusted_image
      @attempts += 1
    rescue Exception => e
      puts e.message
      retry if e.message == Doodler::FailToImprove
    end
  end
end
