module Doodler
  class Tracker
    attr_accessor :queue, :size
    def initialize(element=nil)
      @queue = [element.to_i]
      @size = Doodler::TrackSize || 5
    end

    def enqueue(element)
      self.dequeue if @queue.size == @size
      @queue = [element.to_i] + @queue
    end

    def dequeue
      @queue.slice!(-1)
    end

    def self.track_phase(queue)
      return :spray if queue.size == 0
      m = mean(queue)
      case
      when m >= 10 
        :spray
      when (m < 10) && (m >= 5)
        :stretch
      when (m < 5) && (m >= 3)
        :clean
      else
        :decorate
      end
    end

    private
    # queue records the latest 5 diffs
    # output is the mean of the difference between adjacent diffs
    def self.mean(queue)
      return 0 if queue.size <= 1
      array = [].tap do |x| 
       for index in 1..(queue.size-1)
         x << queue[index] - queue[(index-1)]
       end
      end
      ((array.inject(0){|init, ele| init + ele}).to_f)/(array.size.to_f)
    end
  end
end
