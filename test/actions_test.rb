require "minitest/autorun"

class ActionsTest < Minitest::Test
	def test_move_snake
		initial_state = Model::State.new(
			Model::Snake.new([
				Model::Coord.new(1, 1),
				Model::Coord.new(0, 1)
			]),
			Model::Food.new(4, 4),
			Model::Grid.new(8, 12),
			Direction::DOWN,
			false
		)
	end

	expected_state = initial_state = initial_state = Model::State.new(
			Model::Snake.new([
				Model::Coord.new(1, 1),
				Model::Coord.new(0, 1)
			]),
			Model::Food.new(4, 4),
			Model::Grid.new(8, 12),
			Direction::DOWN,
			false
		)

end