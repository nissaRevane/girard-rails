require 'erb'

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

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
