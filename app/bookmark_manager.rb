require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions
 

  get '/' do
    @bookmarks = Bookmark.all
    @url = session[:url]
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    session[:url] = params[:url]
    redirect '/'
  end

end
