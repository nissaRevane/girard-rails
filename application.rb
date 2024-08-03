# frozen_string_literal: true

require_relative 'controllers/errors_controller'
require_relative 'controllers/experiences_controller'
require_relative 'controllers/home_controller'
require_relative 'controllers/errors_controller'

class Application
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/' then HomeController.index
    when '/experiences' then ExperiencesController.index
    else
      ErrorsController.not_found
    end
  end
end
