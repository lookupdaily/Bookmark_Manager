require 'pg'

class Bookmark  

  @@links = [

  ]

  def self.all
    connection = PG.connect :dbname => 'bookmark_manager'
    result = connection.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| bookmark['url'] }
  end

  # def initialize(link)
  #   @link = link
  #   @@links << self
  # end
end
