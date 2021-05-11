# frozen_string_literal: true

require 'pry'
require 'json'

# API
class Application
  def initialize
    @response = nil
    @request = nil
  end

  def call(env)
    @response = Rack::Response.new
    @request = Rack::Request.new env

    if @request.path == '/crystals' && @request.get?
      index
    elsif @request.path.match(/crystals/) && @request.get?
      show
    elsif @request.path == '/crystals' && @request.post?
      create
    elsif @request.path.match(/crystals/) && @request.patch?
      update
    elsif @request.path.match(/crystals/) && @request.delete?
      destroy
    else
      not_found
    end
  end

  def index
    [
      200,
      { 'Content-Type' => 'application/json' },
      [Crystal.all.to_json]
    ]
  end

  def show
    id = @request.path.split('/')[2]
    [
      200,
      { 'Content-Type' => 'application/json' },
      [Crystal.find(id).to_json]
    ]
  end

  def create
    data = JSON.parse @request.body.read
    new_crystal = Crystal.create(data)
    [
      201,
      { 'Content-Type' => 'application/json' },
      [new_crystal.to_json]
    ]
  end

  def update
    id = @request.path.split('/')[2]
    crystal = Crystal.find(id)
    data = JSON.parse @request.body.read
    crystal.update(data)
    [
      200,
      { 'Content-Type' => 'application/json' },
      [crystal.to_json]
    ]
  end

  def destroy
    id = @request.path.split('/')[2]
    Crystal.find(id).destroy
    [204, {}, ['']]
  end

  def not_found
    [404, {}, ['']]
  end
end
