feature 'updating bookmarks' do
  scenario 'A user can update a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    visit '/'
    first('.bookmark').click_button 'Update'
    fill_in 'url', with: 'http://makers.tech'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Submit'

    expect(current_path).to eq '/'
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Makers Academy', href: 'http://makers.tech')
  end
end
