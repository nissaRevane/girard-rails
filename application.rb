# frozen_string_literal: true

require_relative 'controllers/application_controller'
require_relative 'controllers/experiences_controller'
require_relative 'controllers/home_controller'

class Application
  EXPERIENCED_COMPANY_REGEX = /^\/experiences\/(\w+)/
  HOME_SKILL_REGEX = /^\/home\/(\w+)/

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/' then HomeController.index
    when '/home' then HomeController.index
    when '/experiences' then ExperiencesController.index
    when HOME_SKILL_REGEX then
      match_data = request.path.match(HOME_SKILL_REGEX)
      selected_skill = match_data[1].to_sym
      HomeController.index(selected_skill)
    when EXPERIENCED_COMPANY_REGEX then
      match_data = request.path.match(EXPERIENCED_COMPANY_REGEX)
      company_name = match_data[1]
      ExperiencesController.show(company_name)
    else
      ApplicationController.not_found
    end
  end
end
