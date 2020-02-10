feature 'Navigating home' do
  scenario 'shows a webpage' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
end
