require 'sinatra/base'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base

 

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

end
