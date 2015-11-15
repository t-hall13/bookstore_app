require 'rails_helper'
RSpec.feature "Signing out Users" do
   let!(:user) { Fabricate(:user, email: 'john@example.com') }
   
     scenario 'successfully' do
      visit root_path
      
      click_link 'Sign out'
      expect(page).to have_content("You are signed out.")
    end
   
end