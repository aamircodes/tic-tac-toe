require 'rspec'
require './tictactoe'

describe Tictactoe do
    it "works" do
    # Arrange
    tictactoe = described_class.new

    # Act
    result = tictactoe.do_test("17")

    # Assert
    expect(result).to eq("17")
    end
end