module Doodler
  class Pixelizer < Base
    def pixelize!(size=10)
      raise Doodler::ImageNotFound unless self.baseline_image
      subject = self.baseline_image
      return_val = self.output_image || ChunkyPNG::Image.new(subject.height, subject.width)
      [[:row, subject.height], [:column, subject.width]].each do |orientation, length|
        for i in 0...length
          pixelated = []
          ChunkyPNG.send(orientation, i).each_slice(size) do |slice|
            pixelated += [::ChunkyPNG::Color.rgba(*[:r,:g,:b,:a].map{|chan| 
              (slice.map{|c| ::ChunkPNG::Color.send(chan, c)}.inject(0.0){|sum, v| sum += v} / slice.length).round
            })] * slice.length
          end
          return_val = subject.send("replace_#{orientation}!", i, pixelated)
        end
      end
      return_val
    end
  end
end
