require 'rails_helper'
require 'support/macros'
require 'support/shared_examples'

RSpec.describe Admin::PublishersController, :type => :controller do
  let!(:admin) { Fabricate(:admin) }
  let!(:user) { Fabricate(:user) }
  
   before { set_current_admin admin }
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
             
             expect(response).to redirect_to admin_publisher_path(Publisher.last)
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
            post :create, publisher: Fabricate.attributes_for(:publisher, name:nil)
            
            expect(flash[:danger]).to eq("Publisher has not been created.")
          end
       end
    end
    
    describe "GET #edit" do
       let(:publisher) { Fabricate(:publisher) }
       
       it "sends a successful edit request" do
          get :edit, id: publisher
          
          expect(response).to have_http_status(:success)
       end
    end
    
    describe "PUT #update" do
       context "a successful update" do
          let(:aries) { Fabricate(:publisher, name: "Aries") }
          
          it "updates the modified publisher object" do
             put :update, publisher: Fabricate.attributes_for(:publisher, name:'Leo'), id: aries.id 
                expect(flash[:success]).to eq("Publisher has been updated.")
          end
          
          it "redirects to the show action" do
             put :update, publisher: Fabricate.attributes_for(:publisher, name:'Leo'), id: aries.id 
             expect(response).to redirect_to admin_publisher_path(Publisher.last)
          end
       end
       
       context "an unsuccessful update" do
           let(:aries) { Fabricate(:publisher, name: "Aries") }
           
           it "does not update the publisher object with invalid inputs" do
               put :update, publisher: Fabricate.attributes_for(:publisher, name:nil), id: aries.id
               
               expect(Publisher.last.name).to eq 'Aries'
           end
           
           it "set the failure flash message" do
              put :update, publisher: Fabricate.attributes_for(:publisher, name:nil), id: aries.id
              
              expect(flash[:danger]).to eq "Publisher has not been updated."
           end
       end
    end
    
    describe "DELETE #destroy" do
       let(:publisher) { Fabricate(:publisher) }
       before do
        delete :destroy, id: publisher
      end
       
       it "deletes the publisher with the given id" do
          
          
          expect(Publisher.count).to eq(0)
       end
       
       it "sets the flash message" do
          
          
          expect(flash[:success]).to eq "Publisher has been deleted."
       end
       
       it "redirects to the index action" do
          
          expect(response).to redirect_to admin_publishers_path
       end
    end
end