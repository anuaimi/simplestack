
require 'sinatra/base'

class SimplestackApp < Sinatra::Base

  get '/' do
    "Hello World!!!"
  end

  # start server if ruby file executed directly
  run! if app_file == $0
end

