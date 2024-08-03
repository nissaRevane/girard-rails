# frozen_string_literal: true

require_relative 'application_controller'

class ExperiencesController < ApplicationController
  WORK_EXPERIENCES = [
    { company_name: 'dickson',
      start_date: Date.new(2024, 3, 16),
      end_date: DateTime.now,
      tags: ['Ruby on rails', 'PostgreSQL', 'AWS', 'VueJs'] },
    { company_name: 'enerfip',
      start_date: Date.new(2022, 6, 17),
      end_date: Date.new(2024, 3, 15),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'VueJs'] },
    { company_name: 'shippingbo',
      start_date: Date.new(2019, 10, 1),
      end_date: Date.new(2022, 3, 16),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'EmberJs'] },
  ].freeze

  def self.index
    [200, HTML_HEADER, [render_with_layout('experiences.erb', work_experiences: WORK_EXPERIENCES)]]
  end
end
