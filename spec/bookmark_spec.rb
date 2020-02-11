require 'bookmark'

describe Bookmark do
  # let(:bookmark) { Bookmark.new("link") }

  # it 'should show a list of bookmarks' do
  #   expect(Bookmark.all).to include bookmark
  # end

  it 'should show a hard-coded list of bookmarks' do
    bookmarks = Bookmark.all
    
    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
    expect(bookmarks).to include("http://www.google.com")
  end
end
