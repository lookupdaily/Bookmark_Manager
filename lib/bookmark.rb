class Bookmark  

  @@links = [
    "http://www.makersacademy.com",
    "http://www.destroyallsoftware.com",
    "http://www.google.com"
  ]

  def self.all
    @@links
  end

  def initialize(link)
    @link = link
    @@links << self
  end
end
