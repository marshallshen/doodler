require 'spec_helper'

describe Doodler::Runner do
  let(:image) {mock("test image", :width => 100, :height => 100)}
  let(:strategy) { mock("strategy") }

  describe "#draw" do

    context "#strategy" do
      it "starts drawing with a default strategy" do
        Doodler::Strategy.should_receive(:new).with(image).and_return(strategy)
        strategy.should_receive(:bubblize)
        Doodler::Runner.draw!(image, nil)
      end

      it "starts drawing with a choosen strategy if strategy is passed in param" do
        Doodler::Strategy.should_receive(:new).with(image).and_return(strategy)
        strategy.should_receive(:textify)
        Doodler::Runner.draw!(image, :textify)
      end
    end

  end
end
