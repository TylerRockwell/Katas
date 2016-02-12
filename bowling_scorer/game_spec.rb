require_relative 'game'
RSpec.describe Game do
  let(:game){ Game.new }

  describe "score" do
    it "initializes to 0" do
      expect(game.score).to eq(0)
    end
  end

  describe "#roll" do
    it "takes in the score from the roll" do
      expect(game.score).to eq(0)
      game.roll(7)
      expect(game.score).to eq(7)
      game.roll(2)
      expect(game.score).to eq(9)
    end
  end

  describe "frame" do
    it "initializes to 1" do
      expect(game.current_frame_number).to eq(1)
    end

    it "increments after two rolls" do
      expect(game.current_frame_number).to eq(1)
      game.roll(3)
      expect(game.current_frame_number).to eq(1)
      game.roll(6)
      expect(game.current_frame_number).to eq(2)
    end

    it "increments after a strike" do
      expect(game.current_frame_number).to eq(1)
      game.roll(10)
      expect(game.current_frame_number).to eq(2)
    end
  end

  describe "score" do
    context "when no strikes/spares" do
      it "returns the sum of the rolls" do
        game.roll(7)
        game.roll(2)
        expect(game.score).to eq(9)
      end
    end

    context "when there is a spare" do
      it "returns the score with the spare bonus" do
        game.roll(7)
        game.roll(3)
        game.roll(5)

        expect(game.score).to eq(20)
      end
    end

    context "when there is a strike" do
      it "returns the score with the spare bonus" do
        game.roll(10)
        game.roll(3)
        game.roll(5)

        expect(game.score).to eq(26)
      end
    end

    context "when there are strikes on the last frame" do
      it "returns the score with the last frame bonus" do
        12.times{ game.roll(10) }
        expect(game.score).to eq(300)
      end
    end
  end

  describe "#end_game" do
    it "returns the final score from the game" do
      20.times{ game.roll(3) }
      expect{ game.end_game }.to output("Your score for this game was 60\n").to_stdout
    end
  end
end
