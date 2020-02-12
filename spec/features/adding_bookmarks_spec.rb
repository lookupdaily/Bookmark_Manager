feature 'adding bookmarks' do 
  scenario 'adds a bookmark' do 
    visit '/' 
    click_button 'Add'
    fill_in 'url', with: 'http:www.wikipedia.com'
    click_button 'Submit'
    expect(page).to have_content 'http:www.wikipedia.com'
  end 
end 