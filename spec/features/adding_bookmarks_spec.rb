feature 'adding bookmarks' do 
  scenario 'adds a bookmark' do 
    visit '/' 
    click_button 'Add'
    fill_in 'url', with: 'http://www.wikipedia.com'
    fill_in 'title', with: 'Wikipedia'
    click_button 'Submit'
    expect(page).to have_link('Wikipedia', href: 'http://www.wikipedia.com')
  end 

  scenario 'The bookmark must be a valid url' do
    visit '/add'
    fill_in 'url', with: 'not a real bookmark'
    click_button 'Submit'

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
