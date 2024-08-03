# frozen_string_literal: true

require_relative 'application_controller'

class HomeController < ApplicationController
  def self.index
    [200, HTML_HEADER, [render_with_layout('index.erb')]]
  end
end
