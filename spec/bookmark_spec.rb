require 'bookmark'

describe Bookmark do

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end
  
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.delete' do
    it 'removes link from database' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.find' do

    let(:bookmark) { Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark') }
    let(:result) { Bookmark.find(id: bookmark.id) }

    it 'result is a bookmark' do
      expect(result).to be_a Bookmark
    end

    it 'has the same id as original' do
      expect(result.id).to eq bookmark.id
    end

    it 'has the same title' do
      expect(result.title).to eq 'Test Bookmark'
    end

    it 'has the same url' do
      expect(result.url).to eq 'http://www.testbookmark.com'
    end
    
  end

  describe '.update' do
    let(:bookmark) { Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark') }
    let(:updated_bookmark) { Bookmark.update(id: bookmark.id, url: 'http://www.test.com', title: 'Test') }

    it 'updated bookmark is a bookmark' do
      expect(updated_bookmark).to be_a Bookmark
    end

    it 'updated bookmark has the same id ' do
      expect(updated_bookmark.id).to eq bookmark.id
    end

    it 'has the new title' do
      expect(updated_bookmark.title).to eq 'Test'
    end

    it 'has the new url' do
      expect(updated_bookmark.url).to eq 'http://www.test.com'
    end

  end
end
