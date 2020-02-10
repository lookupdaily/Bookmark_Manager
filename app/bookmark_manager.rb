require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end
end
