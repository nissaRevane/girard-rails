# frozen_string_literal: true

require 'date'
require_relative 'application_controller'

class ExperiencesController < ApplicationController
  WORK_EXPERIENCES = [
    { company_name: 'dickson',
      start_date: DateTime.new(2024, 3, 22),
      end_date: DateTime.now,
      tags: ['Ruby on rails', 'Elixir Phoenix', 'PostgreSQL', 'MySQL', 'AWS', 'Docker', 'Kubernetes', 'Sidekiq', 'VueJs'] },
    { company_name: 'enerfip',
      start_date: DateTime.new(2022, 6, 13),
      end_date: DateTime.new(2024, 3, 21),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'RabbitMQ', 'VueJs'] },
    { company_name: 'shippingbo',
      start_date: DateTime.new(2019, 10, 1),
      end_date: DateTime.new(2022, 6, 10),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku', 'Sidekiq', 'EmberJs'] },
  ].freeze

  INTERN_EXPERIENCES = [
    { company_name: 'radiall',
      start_date: DateTime.new(2019, 2, 1),
      end_date: DateTime.new(2019, 8, 15),
      tags: ['Ruby on rails', 'PostgreSQL', 'Heroku'] },
    { company_name: 'total',
      start_date: DateTime.new(2017, 8, 1),
      end_date: DateTime.new(2018, 2, 15),
      tags: ['Python', 'Flask', 'SQLAlchemy'] },
  ].freeze

  DEGREE_EXPERIENCES = [
    { company_name: 'insa',
      start_date: DateTime.new(2016, 9, 1),
      end_date: DateTime.new(2019, 9, 17),
      tags: ['informatique', 'génie industriel'] },
    { company_name: 'master',
      start_date: DateTime.new(2018, 9, 1),
      end_date: DateTime.new(2019, 9, 17),
      tags: ['management', 'gestion de projet', 'agilité', 'finance', 'marketing'] },
  ].freeze

  EXPERIENCES = WORK_EXPERIENCES + INTERN_EXPERIENCES + DEGREE_EXPERIENCES

  def self.index
    [
      200,
      HTML_HEADER,
      [render_with_layout(
        'experiences/index.html.erb',
        work_experiences: WORK_EXPERIENCES,
        intern_experiences: INTERN_EXPERIENCES,
        degree_experiences: DEGREE_EXPERIENCES
      )]
    ]
  end

  def self.show(company_name)
    experience = EXPERIENCES.find { |exp| exp[:company_name] == company_name }
    return ErrorsController.not_found unless experience
    
    [
      200,
      HTML_HEADER,
      [render_with_layout(
        'experiences/show.html.erb',
        company_name: experience[:company_name],
        start_date: experience[:start_date],
        end_date: experience[:end_date],
        tags: experience[:tags]
      )]
    ]
  end
end
