require 'rails_helper'
require 'support/macros'

RSpec.feature "Creating orders" do
  let!(:book) { Fabricate(:book) }
  let!(:cart) { Fabricate(:cart) }
  let(:user) { Fabricate(:user) }
  before do 
    sign_in_as user
  end
  
  scenario 'creates a valid book', :js => true  do 
    visit root_path
    click_link 'Catalogs'
    click_link book.title
    click_button 'Add to cart'
    click_button 'Checkout'
    
    fill_in 'Credit Card Number', with: '4242424242424242'
    fill_in 'Security Code', with: '123'
    select '10 - October', from: 'date_month'
    select '2016', from: 'date_year'
    print page.html
    click_button 'Create Order'
    
    expect(page).to have_content('Order has been created.')
  end
end