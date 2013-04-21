module Doodler
  class Runner
    def self.draw!(image, strategy)
      strategy = :bubblize unless strategy
      Doodler::Strategy.new(image).send(strategy)
    end
  end
end
