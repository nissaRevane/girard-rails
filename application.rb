# frozen_string_literal: true

require_relative 'controllers/errors_controller'
require_relative 'controllers/experiences_controller'
require_relative 'controllers/home_controller'
require_relative 'controllers/errors_controller'

class Application
  EXPERIENCED_COMPANY_REGEX = /^\/experiences\/(\w+)/

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/' then HomeController.index
    when '/experiences' then ExperiencesController.index
    when EXPERIENCED_COMPANY_REGEX then
      match_data = request.path.match(EXPERIENCED_COMPANY_REGEX)
      company_name = match_data[1]
      ExperiencesController.show(company_name)
    else
      ErrorsController.not_found
    end
  end
end
