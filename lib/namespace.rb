# frozen_string_literal: true

require 'erb'

# The Namespace class is responsible for rendering ERB templates
class Namespace
  def initialize(hash)
    hash.each do |key, value|
      singleton_class.send(:define_method, key) { value }
    end
  end

  def render(template_path, kwargs = {})
    path = File.expand_path("../../views/#{template_path}", __FILE__)
    template = File.read(path)
    namespace = Namespace.new(kwargs)

    ERB.new(template).result(namespace.call_binding)
  end

  def call_binding
    binding
  end
end
