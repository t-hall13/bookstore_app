require 'rails_helper'
require 'support/macros'

RSpec.feature "Editing Authors" do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let!(:author) { Fabricate(:author) }
  
  
  before do 
    sign_in_as admin
  end
  
  # scenario 'access to non-admin users not allowed' do
  #   deny_access_to_non_admins(user, 'Publishers')
  # end
  
  scenario "successfully updates the Author with valid inputs" do
    visit root_path
    click_link "Authors"
    click_link author.full_name
    click_link 'Edit'
    
    fill_in 'First name', with: "Paul"
    fill_in 'Last name', with: "Moose"
    click_button 'Update Author'
    
    expect(page).to have_content('Author has been updated.')
  end
  
   scenario "unsuccessfully updates the Author with invalid inputs" do
    visit root_path
    click_link "Authors"
    click_link author.full_name
    click_link 'Edit'
    
    fill_in 'First name', with: ""
    fill_in 'Last name', with: ""
    click_button 'Update Author'
    
    expect(page).to have_content('Author has not been updated.')
    expect(page).to have_content("can't be blank" )
  end
end