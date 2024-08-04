# frozen_string_literal: true

require 'date'
require_relative 'application_controller'

class ExperiencesController < ApplicationController
  WORK_EXPERIENCES = [
    { company_name: 'dickson',
      start_date: DateTime.new(2024, 3, 16),
      end_date: DateTime.now,
      tags: ['Ruby on rails', 'PostgreSQL', 'AWS', 'VueJs'] },
    { company_name: 'enerfip',
      start_date: DateTime.new(2022, 6, 17),
      end_date: DateTime.new(2024, 3, 15),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'VueJs'] },
    { company_name: 'shippingbo',
      start_date: DateTime.new(2019, 10, 1),
      end_date: DateTime.new(2022, 3, 16),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'EmberJs'] },
  ].freeze

  def self.index
    [
      200,
      HTML_HEADER,
      [render_with_layout('experiences/index.html.erb', work_experiences: WORK_EXPERIENCES)]
    ]
  end

  def self.show(company_name)
    work_experience = WORK_EXPERIENCES.find { |exp| exp[:company_name] == company_name }
    return ErrorsController.not_found unless work_experience
    
    [
      200,
      HTML_HEADER,
      [render_with_layout(
        'experiences/show.html.erb',
        company_name: work_experience[:company_name],
        start_date: work_experience[:start_date],
        end_date: work_experience[:end_date],
        tags: work_experience[:tags]
      )]
    ]
  end
end
