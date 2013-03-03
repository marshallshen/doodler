module Doodler
  class Tracker
    attr_accessor :queue, :size
    def initialize(element=nil)
      @queue = [elment.to_i]
      @size = Doodler::TrackerSize || 5
    end

    def enqueue(element)
      self.dequeue if @queue.size == @size
      @queue = [element.to_i] + @queue
    end

    def dequeue
      @queue.slice!(-1)
    end

    def self.track_phase(queue)
      case mean
      when mean >= 10
        :spray
      when (mean < 10) && (mean > 5)
        :stretch
      else
        :clean
      end
    end

    private
    def self.mean
      ((@queue.inject(0){|init, ele| init + ele}).to_f)/(@queue.size.to_f)
      # alternative
      # @queue.instance_eval { reduce(:+) / @queue.size.to_f }
    end
  end
end
