require 'bookmark'

describe Bookmark do

  it 'should show a hard-coded list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")
    bookmarks = Bookmark.all
    
    expect(bookmarks).to include(url: "http://www.makersacademy.com", title: "Makers")
    expect(bookmarks).to include(url: "http://www.destroyallsoftware.com", title: "Destroy all Software")
    expect(bookmarks).to include(url: "http://www.google.com", title: "Google")
  end

  describe '#create' do 

    it 'should added url and title to database' do 
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      expect(Bookmark.all).to include(url: "http://www.google.com", title: "Google")
    end
  end 
end
