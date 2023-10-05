# frozen_string_literal: true

require_relative './lib/namespace'

# The Application class is responsible for handling incoming HTTP requests
# and returning the appropriate response
class Application
  HTML_HEADER = { 'Content-Type' => 'text/html' }.freeze

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/' then [200, HTML_HEADER, [render('index.erb')]]
    when '/experiences' then [200, HTML_HEADER, [render('experiences.erb')]]
    else
      [404, HTML_HEADER, [render('not_found.erb')]]
    end
  end

  def render(template_path, kwargs = {})
    path = File.expand_path("../views/#{template_path}", __FILE__)
    template = File.read(path)
    namespace = Namespace.new(kwargs)

    ERB.new(template).result(namespace.call_binding)
  end
end
