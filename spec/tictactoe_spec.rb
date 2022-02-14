require 'rspec'
require './tictactoe'

describe Tictactoe do
    it "works" do
    # Arrange
    tictactoe = described_class.new

    # Act
    result = tictactoe.do_test("21")

    # Assert
    expect(result).to eq("21")
    end
end