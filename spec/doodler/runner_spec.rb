require 'spec_helper'

describe Doodler::Runner do
  let(:image) {mock("original image", :width => 100, :height => 100)}
  describe "#draw" do
    before do
      Doodler::Runner.any_instance.stub(:adjust)
      Doodler::Runner.any_instance.stub(:render)
      Doodler::Runner.any_instance.stub(:close)
    end
    context "when the output image is not similar enough to the original image", :buggy => true do
      it "should adjust output picture" do
        Doodler::Runner.any_instance.stub(:difference).and_return(1001)
        subject = Doodler::Runner.new(image)
        subject.should_receive(:adjust)
        subject.draw!
      end
      it "should render output picture" do
        Doodler::Runner.any_instance.stub(:difference).and_return(1001)
        subject = Doodler::Runner.new(image)
        subject.should_receive(:render)
        subject.draw!
      end
    end
    context "when the output image is similar to the original image" do
      it "should close the process" do
        Doodler::Runner.any_instance.stub(:difference).and_return(999)
        subject = Doodler::Runner.new(image)
        subject.should_receive(:close)
        subject.draw!
      end
    end
  end
end
