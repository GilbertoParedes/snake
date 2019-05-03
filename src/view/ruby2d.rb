require "ruby2d"
require_relative "../model/state"

module View

	class Ruby2dView

		# constructor de clase
		def initialize(app)
			@pixel_size = 50;
			@app = app
		end

		def start(state)
			extend Ruby2D::DSL
			set(
				title: "Snake",
				width: @pixel_size * state.grid.cols,
				height: @pixel_size * state.grid.rows)
			on :key_down do |event|
			  handle_key_event(event)
			end
			show
		end

		def render(state)
			render_food(state)
			render_snake(state)
		end

		# Clases privadas
		private

		def render_food(state)
			@food.remove if @food
			extend Ruby2D::DSL
			food = state.food
			@food = Square.new(
			  x: food.col * @pixel_size,
			  y: food.row * @pixel_size,
			  size: @pixel_size,
			  color: 'yellow'
			)
			
		end

		def render_snake(state)
			@snake_positions.each(&:remove) if @snake_positions
			extend Ruby2D::DSL
			snake = state.snake
			@snake_positions = snake.positions.map do |pos|
				Square.new(
				  x: pos.col * @pixel_size,
				  y: pos.row * @pixel_size,
				  size: @pixel_size,
				  color: 'green'
				)
			end
		end

		def handle_key_event(event)
			case event.key
			when "up"
				#cambiar dirección hacia arriba
				@app.send_action(:change_direction, Model::Direction::UP)
			when "down"
				#cambiar la dirección hacia abajo
				@app.send_action(:change_direction, Model::Direction::DOWN)
			when "left"
				#cambiar la dirección hacia la izquierda
				@app.send_action(:change_direction, Model::Direction::LEFT)
			when "right"
				#cambiar la dirección hacia la derecha
				@app.send_action(:change_direction, Model::Direction::RIGHT)
			end
		end
	end
end