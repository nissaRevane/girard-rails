# frozen_string_literal: true

require_relative 'application_controller'

class HomeController < ApplicationController
  SKILLS = {
    monitoring: 'top-left',
    async: 'top',
    frontend: 'top-right',
    database: 'middle-left',
    rails: 'middle',
    test: 'middle-right',
    agile: 'bottom-left',
    cloud: 'bottom',
    architecture: 'bottom-right'
  }.freeze

  def self.index(selected_skill = :rails)
    return not_found unless SKILLS.key?(selected_skill)

    [
      200,
      HTML_HEADER,
      [render_with_layout('home.html.erb', skills: SKILLS, selected_skill:)]
    ]
  end
end
