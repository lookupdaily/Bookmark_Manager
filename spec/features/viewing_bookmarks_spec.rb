feature 'Viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit '/'
    click_on 'My Bookmarks'

    expect(page).to have_content "Your bookmarks"
  end

  scenario 'viewing a list of bookmarks' do
    visit '/'
    click_on 'My Bookmarks'

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
