require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative '../lib/bookmark'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  delete '/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

  get '/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :update
  end

  patch '/:id' do
    @bookmark = Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/'
  end
  
end
