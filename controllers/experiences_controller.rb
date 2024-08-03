# frozen_string_literal: true

require_relative 'application_controller'

class ExperiencesController < ApplicationController
  def self.index
    [200, HTML_HEADER, [render('experiences.erb')]]
  end
end
