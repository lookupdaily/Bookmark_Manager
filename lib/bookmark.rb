require 'pg'

class Bookmark  
  attr_reader :url

  def initialize(url)
    @url = url
    add
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    @bookmark = Bookmark.new(url)
  end 

  def add
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    p connection.exec("INSERT INTO bookmarks VALUES(1, 'google.com');")
  end 

  




end
