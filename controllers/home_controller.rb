# frozen_string_literal: true

require_relative 'application_controller'

class HomeController < ApplicationController
  SKILLS = {
    rails: 'middle',
    database: 'middle-left',
    test: 'middle-right',
    cloud: 'bottom',
    async: 'top',
    frontend: 'top-right',
    monitoring: 'top-left'
  }.freeze

  def self.index
    [200, HTML_HEADER, [render_with_layout('home.html.erb', skills: SKILLS)]]
  end
end
