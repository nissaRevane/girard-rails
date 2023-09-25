require 'rack'
require_relative 'application'

use Rack::Reloader, 0
use Rack::Static, urls: ['/public']
run Application.new
