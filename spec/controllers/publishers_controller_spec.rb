require 'rails_helper'
RSpec.describe PublishersController, :type => :controller do
    describe "GET #index" do
       it "returns a successful http request status code" do
       
       get :index
       expect(response).to have_http_status(:success)
       end
        it "renders the index template"do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #show" do
       it "returns a successful http request" do
          publisher = Fabricate(:publisher)
          
          get :show, id: publisher.id
          expect(response).to have_http_status(:success)
       end
    end
    
    describe "GET #new" do
       it "returns a successful http request status code" do
         get :new
         expect(response).to have_http_status(:success)
      end
       it "renders the new template" do
           get :new
           expect(response).to render_template('new')
        end
    end
    describe "POST #create" do
       context "a successful create" do
          it "saves the new publisher object" do
              post :create, publisher: Fabricate.attributes_for(:publisher)
              
              expect(Publisher.count).to eq(1)
          end
          
          it "redirects to the  publisher show action" do
             post :create, publisher: Fabricate.attributes_for(:publisher)
             
             expect(response).to redirect_to publisher_path(Publisher.last)
          end
          
          it "sets the success flash message" do
              post :create, publisher: Fabricate.attributes_for(:publisher)
              
              expect(flash[:success]).to eq("Publisher has been created.")
          end
       end
       
       context "an unsuccessful create" do
          it "does not save the publisher object with invalid inputs" do
             post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
             
             expect(Publisher.count).to eq(0)
          end
          
          it "sets the failure flash message" do
            post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
            
            expect(flash[:danger]).to eq("Publisher has not been created.")
          end
       end
    end
end