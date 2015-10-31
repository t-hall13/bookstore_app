require 'rails_helper'
RSpec.describe BooksController, :type => :controller do
    describe "GET #index" do
        it "returns a successful http request status code" do
           get :index
           expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET #show" do
       it "returns a successful http request status code" do
           book = Fabricate(:book)
            get :show, id:book
            expect(response).to have_http_status(:success)
       end
    end
    
    describe "GET #new" do
      it "returns a successful http request code" do
         get :new
         expect(response).to have_http_status(:success)
      end
    end
end