# frozen_string_literal: true

require 'pry'
require 'json'

# API
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new env
  end
end
