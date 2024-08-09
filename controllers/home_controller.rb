# frozen_string_literal: true

require_relative 'application_controller'

class HomeController < ApplicationController
  SKILLS = %w[
    rails
    database
    test
    cloud
    async
    frontend
  ]
  def self.index
    [200, HTML_HEADER, [render_with_layout('home.html.erb', skills: SKILLS)]]
  end
end
