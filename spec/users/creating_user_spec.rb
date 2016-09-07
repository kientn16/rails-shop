require 'rails_helper'
feature 'Creating User' do
  scenario 'can create a user' do
    # 1. go to root where will be button to Add New Book:
    visit '/admin'
    # 2. click on Add New Book button
    click_button 'New'
    # 3. Fill form - add title
    fill_in 'book_title', with: 'Ulisses'
    # 4. Click on submit form button
    click_button 'Save Book'
    # 5. Then we should be redirected to show page with book details (book title)
    expect(page).to have_content('Ulisses')
  end
end