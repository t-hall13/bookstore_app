require 'rails_helper'
 feature "Signing in Users" do
   let!(:user) { Fabricate(:user, email: 'john@example.com') }
    
    scenario 'successfully' do
      visit root_path
      
      click_link 'Sign in'
      
      fill_in 'Email Address', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      
      expect(page).to have_content('Sign in successful.')
    end
    
    scenario 'unsuccessfully' do
      visit root_path
      
      click_link 'Sign in'
      
      fill_in 'Email Address', with: user.email
      fill_in 'Password', with: ''
      click_button 'Sign in'
      
      expect(page).to have_content('Invalid email/password combination.')
    end
    
end