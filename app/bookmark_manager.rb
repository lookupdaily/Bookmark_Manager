require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base



  get '/' do
    @bookmarks = Bookmark.all
    p "reading urls:"
    
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Bookmark.create(url: params[:url], title: params[:title])
    p "Adding new url:" 
    p ObjectSpace.each_object(Bookmark).count
    redirect '/'
  end

  get '/test' do
    p ObjectSpace.each_object(Bookmark).count
    "hello"
  end

  post '/delete' do
    'delete'
    redirect '/'
  end
end
