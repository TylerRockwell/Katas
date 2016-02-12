require_relative 'frame'

RSpec.describe Frame do
  let(:frame){ Frame.new }
  describe "#add_roll" do
    it "adds the roll to the frame and updates frame.complete?" do
      frame.add_roll(5)
      expect(frame.complete?).to eq(false)
      frame.add_roll(3)
      expect(frame.complete?).to eq(true)
    end
  end

  describe "#score" do
    context "when there are rolls" do
      let(:complete_frame) do
        frame = Frame.new
        frame.add_roll(3)
        frame.add_roll(5)
        frame
      end

      it "returns the sum of rolls" do
        expect(complete_frame.score).to eq(8)
      end
    end

    context "when there are no rolls" do
      let(:empty_frame){ Frame.new }
      it "returns 0" do
        expect(empty_frame.score).to eq(0)
      end
    end
  end

  describe "#score_type" do
    context "when normal frame" do
      it "should return 'regular'" do
        frame.add_roll(5)
        frame.add_roll(3)
        expect(frame.score_type).to eq("regular")
      end
    end

    context "when spare" do
      it "should return 'regular'" do
        frame.add_roll(5)
        frame.add_roll(5)
        expect(frame.score_type).to eq("spare")
      end
    end

    context "when strike" do
      it "should return 'regular'" do
        frame.add_roll(10)
        expect(frame.score_type).to eq("strike")
      end
    end
  end
end
