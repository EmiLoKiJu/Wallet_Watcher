require 'rails_helper'

RSpec.feature 'splash screen view', type: :system do
  fixtures :users
  context 'when user is not signed in' do
    before do
      visit root_path
    end

    it 'displays the login and sign up buttons' do
      expect(page).to have_button('LOG IN')
      expect(page).to have_button('SIGN UP')
    end

    it 'redirects to the new session path when the login button is clicked' do
      click_button 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'redirects to the new user registration path when the sign up button is clicked' do
      click_button 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
  
  context 'when user is signed in' do
    before do
      user = users(:one)
      login_as(user, scope: :user)
      visit root_path
    end

    it 'displays the categories and log out buttons' do
      expect(page).to have_button('CATEGORIES')
      expect(page).to have_button('LOG OUT')
    end

    it 'redirects to the groups path when the categories button is clicked' do
      click_button 'CATEGORIES'
      expect(page).to have_current_path(groups_path)
    end

    it 'logs out the user and redirects to the splash screen when the log out button is clicked' do
      click_button 'LOG OUT'
      expect(page).to have_current_path(root_path)
      expect(page).to have_button('LOG IN')
      expect(page).to have_button('SIGN UP')
    end
  end
end
