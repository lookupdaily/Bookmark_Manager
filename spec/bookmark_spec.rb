require 'bookmark'

describe Bookmark do

  it 'should show a hard-coded list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    bookmarks = Bookmark.all
    
    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
    expect(bookmarks).to include("http://www.google.com")
  end

  describe '#create' do 

    it 'should added url to database' do 
      Bookmark.create('http://www.google.com')
      expect(Bookmark.all).to include("http://www.google.com")
    end
  end 
end
