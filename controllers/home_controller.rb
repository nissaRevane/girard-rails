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

  def self.index
    [200, HTML_HEADER, [render_with_layout('home.html.erb', skills: SKILLS)]]
  end
end
