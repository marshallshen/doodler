require 'spec_helper'

describe Doodler::Runner do
  let(:image) {mock("original image")}
  let(:subject) {Doodler::Runner.new(image)}
  describe "#draw" do
    context "when the output image is not similar enough to the original image" do
      it "should adjust output picture" do
      end
      it "should render output picture" do
      end
    end
    context "when the output image is similar to the original image" do
      it "should close the process" do
      end
    end
  end
end
