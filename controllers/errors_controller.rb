# frozen_string_literal: true

require_relative '../application_controller'

class ErrorsController < ApplicationController
  def self.not_found
    [404, HTML_HEADER, [render('not_found.erb')]]
  end
end
