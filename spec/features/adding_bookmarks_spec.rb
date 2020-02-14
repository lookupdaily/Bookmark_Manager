feature 'adding bookmarks' do 
  scenario 'adds a bookmark' do 
    visit '/' 
    click_button 'Add'
    fill_in 'url', with: 'http://www.wikipedia.com'
    fill_in 'title', with: 'Wikipedia'
    click_button 'Submit'
    expect(page).to have_link('Wikipedia', href: 'http://www.wikipedia.com')
  end 
end

