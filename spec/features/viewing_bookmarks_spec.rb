feature 'Viewing bookmarks' do

  scenario 'viewing a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: "Google")

    visit '/'

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
