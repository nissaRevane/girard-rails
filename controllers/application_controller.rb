# frozen_string_literal: true

require_relative '../lib/namespace'

class ApplicationController
  HTML_HEADER = { 'Content-Type' => 'text/html' }.freeze

  def self.render(template_path, kwargs = {})
    path = File.expand_path("../../views/#{template_path}", __FILE__)
    template = File.read(path)
    namespace = Namespace.new(kwargs)

    ERB.new(template).result(namespace.call_binding)
  end

  def self.render_with_layout(template_path, kwargs = {})
    render('layout.erb', {template_path: , kwargs:})
  end

  def self.not_found
    [404, HTML_HEADER, [render_with_layout('not_found.erb')]]
  end
end
