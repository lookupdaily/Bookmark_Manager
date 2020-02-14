feature 'Deleting bookmarks' do

    scenario 'delete a bookmark from a list' do
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

      visit '/'
      click_on 'delete_Makers'
      expect(current_path).to eq '/'
      expect(page).not_to have_link("Makers", href: 'http://www.makersacademy.com')
    end
  
  end