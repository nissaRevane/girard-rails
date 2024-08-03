# frozen_string_literal: true

require_relative '../lib/namespace'

class ApplicationController
  HTML_HEADER = { 'Content-Type' => 'text/html' }.freeze

  def render(template_path, kwargs = {})
    path = File.expand_path("../views/#{template_path}", __FILE__)
    template = File.read(path)
    namespace = Namespace.new(kwargs)

    ERB.new(template).result(namespace.call_binding)
  end
end
