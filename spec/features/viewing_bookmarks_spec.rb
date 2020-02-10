feature 'Viewing bookmarks' do
  scenario 'visiting the bookmarks page' do
    visit '/'
    click_on 'My Bookmarks'

    expect(page).to have_content "Your bookmarks"
  end
end