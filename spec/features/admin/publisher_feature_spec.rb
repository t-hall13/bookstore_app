require 'rails_helper'
RSpec.feature "Creating Publishers" do
   let(:admin) { Fabricate(:admin) }
    
    before { sign_in_as admin }
    
    
    scenario "with valid inputs succeeds" do
        visit root_path
        
        click_link "Publishers"
        click_link "Add New Publisher"
        
        fill_in "Name", with: "XYZ Press"
        
        click_button "Create Publisher"
        
        expect(page).to have_content("Publisher has been created.")
    end
    
     scenario "with an invalid input fails" do
        visit root_path
        
        click_link "Publishers"
        click_link "Add New Publisher"
        
        fill_in "Name", with: ""
       
        
        click_button "Create Publisher"
        
        expect(page).to have_content("Publisher has not been created.")
    end
end