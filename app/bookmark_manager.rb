require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Bookmark.create(params[:url])
    redirect '/'
  end

end
