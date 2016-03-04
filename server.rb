require 'rubygems'
require 'sinatra'
require File.expand_path("../envelope.rb", __FILE__)
require 'json'

set :port, ENV['PORT'] || 3000

before do
   content_type :json
   headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

get '/check' do
  {status: "I am alive."}.to_json
end

options '/envelope' do
  200
end


post '/envelope' do
  if params[:code] == ENV['SECRET']
    required = ["name", "address1", "city", "state", "zipcode"]

    required.each do |k|
      puts params.inspect
      if !params.has_key?(k)
        status 422
        return {error: "Missing required parameter: #{k}"}.to_json
      end
    end

    Envelope.call(
      name: params[:name],
      address1: params[:address1],
      address2: params[:address2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode]
    )
  else
    # Respond 401
    status(401)
    {error: "Invalid Token"}.to_json
  end
end
