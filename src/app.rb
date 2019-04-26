# Llama al archivo de la vista con una ruta relativa
require_relative "view/ruby2d"
require_relative "model/state"



class APP
	def start
		view = View::Ruby2dView.new
		initial_state = Model::initial_state
		view.render(initial_state)
	end

	def init_timer
		loop do
			sleep 0.5
			# triggermovement
			
		end
	end

end