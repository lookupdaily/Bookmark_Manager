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
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

end
