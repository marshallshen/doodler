require 'spec_helper'

describe Doodler::Runner do
  let(:image) {mock("original image", :width => 100, :height => 100)}
  describe "#draw" do
    before do
      Doodler::Runner.any_instance.stub(:adjust)
      Doodler::Runner.any_instance.stub(:render)
      Doodler::Runner.any_instance.stub(:close)
    end

    context "when the output image is similar to the original image" do
      it "should close the process" do
        Doodler::Runner.any_instance.stub(:difference).and_return(999)
        subject = Doodler::Runner.new(image)
        subject.should_receive(:close)
        subject.draw!
      end
    end

    describe "#adjust" do
      it "notifies when doodler is drawing"
      it "initializes a strategy"
      it "compares the difference of the output image and new image"
      it "raise FailToImprove if Doodler doodles badly"
    end
  end
end
