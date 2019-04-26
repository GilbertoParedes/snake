module Actions

	def self.move_snake(state)
		next_direction = state.next_direction
		next_position = calc_next_position(state)
		# verificar que la siguiente casilla sea valida
		if position_is_valid?(state, next_position)
			move_snake_to(state, next_position)
		else 
			end_game(state)
		end
	end

private 
def calc_next_position(state)
	curr_position = state.snake.positions.first
	case state.next_direction
	when UP
		# decreentar fila
		return Model::Coord.new(
			curr_position.row -1, 
			curr_position.row)
	when RIGHT
		# incrementar col
		return Model::Coord.new(
			curr_position.row, 
			curr_position.col + 1)
    when DOWN
    	# incrementar fila
    	return Model::Coord.new(
			curr_position.row + 1, 
			curr_position.col)
    when LEFT
    	#decrementar col
    	return Model::Coord.new(
			curr_position.row, 
			curr_position.col - 1)
	end

	def position_is_valid?(state, position)
		# vareficar que esté en la grilla
		is_invalid = ((position.row >= state.grid.rows ||
			position.row < 0) || 
		   (position.col >= state.grid.cols ||
			position.row < 0))

		return false if is_invalid
		# ferificar que no esté superponiendo a la serpiente
		return !(state.snake.position.include? position)
	end

	def move_snake_to(state, next_position)
		new_positions = [next_position] + state.snake.positions[0...-1]
		state.snake.positions = new_positions
		# retorna el estado
		state
	end

	def end_game(state)
		state.game_finished = true
		state
	end
end