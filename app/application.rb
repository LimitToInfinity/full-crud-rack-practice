# frozen_string_literal: true

require 'pry'
require 'json'

# API
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new env

    if req.path == '/crystals'
      index
    elsif req.path.match(/crystals/) && req.path.split('/')[2]
      show req
    end
  end

  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [Crystal.all.to_json]
    ]
  end

  def show(req)
    req.params[:id] = req.path.split('/')[2]
    [
      200,
      { 'Content-Type' => 'application/json' },
      [Crystal.find(req.params[:id]).to_json]
    ]
  end
end
