require 'rails_helper'
require 'support/macros'
RSpec.describe AuthorsController, :type => :controller do
  let!(:admin) { Fabricate(:admin) }
  let!(:user) { Fabricate(:user) }
  
  before { set_current_admin admin }
  
    describe "GET #index" do
      context "guest users" do
        before { clear_current_user }
        
        it "redirects to the signin page for unauthenticated users" do
          get :index
          expect(response).to redirect_to signin_path
        end
      end
      
      context "non-admin users" do
        before { set_current_user }
        
        it "redirects to the root path" do
          get :index
          expect(response).to redirect_to root_path
        end
      end
      
      context "admin users" do
        it "returns a successful http request status code" do
              
              get :index
              expect(response).to have_http_status(:success)
          end    
         it "renders the index template" do
            get :index
            expect(response).to render_template :index
         end
      end
    end
      
    describe "GET #show" do
      let!(:author) { Fabricate(:author) }
      context "guest users" do
        before { clear_current_user }
        it "redirects to the signin page for un-autheticated users" do
          get :show, id: user.id
          expect(response).to redirect_to signin_path
        end
      end
      
      context "non-admin users" do
        before do 
          clear_current_user
          set_current_user
        end
        
        it "redirects to the root path"do
         get :show, id: user.id
         expect(response).to redirect_to root_path
        end
      end
      
      context "admin users" do
        it "returns a successful http request status code" do
            
          get :show, id: author.id
          expect(response).to have_http_status(:success) 
        end
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
        it "saves the new author object" do
                 #require 'pry'; binding.pry
          post :create, author: Fabricate.attributes_for(:author)
                 
          expect(Author.count).to eq(1)
        end
             
        it "redirects to the author show action" do
          post :create, author: Fabricate.attributes_for(:author)
                
          expect(response).to redirect_to author_path(Author.last)
        end
             
        it "sets the success flash message" do
          post :create, author: Fabricate.attributes_for(:author)
                
          expect(flash[:success]).to eq("Author has been created.")
        end
      end
         
      context "an unsuccessful create" do
        it "does not save the author object with invalid inputs" do
          post :create, author: Fabricate.attributes_for(:author, first_name: nil)
               
          expect(Author.count).to eq 0
        end
             
             
        it "sets the failure flash message" do
          post :create, author: Fabricate.attributes_for(:author, first_name: nil)
                
          expect(flash[:danger]).to eq("Author has not been created.")
        end
      end
    end
    
    describe "GET #edit" do
        let(:author) { Fabricate(:author) }
        
        it "sends a successful edit request" do
            get :edit, id: author
            
           expect(response).to have_http_status(:success)
        end
    end
    
    describe "PUT #update" do
        context "a successful update" do
            let(:bob) { Fabricate(:author, first_name:"Bob") }
            
            it "updates the modified author object" do
               put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: bob.id
               
               expect(Author.last.first_name).to eq 'Paul'
               expect(Author.last.first_name).not_to eq 'Bob'
            end
            
            it "sets the success flash message" do
                put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: bob.id
                
                expect(flash[:success]).to eq "Author has been updated."
            end
            
            it "redirects to the show action" do
                 put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul'), id: bob.id
                expect(response).to redirect_to author_path(Author.last)
            end
        end
        
        context "an unsuccessful update" do
           let(:bob) { Fabricate(:author, first_name:"Bob") }
            
            it "does not update the author object with invalid inputs" do
               put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: bob.id
               
               expect(Author.last.first_name).to eq 'Bob'
            end
            
            it "sets the failure flash message" do
                put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: bob.id
                
                expect(flash[:danger]).to eq "Author has not been updated."
            end
        end
    end
    
    describe "DELETE #destroy" do
       let(:author) { Fabricate(:author) }
       
       it "deletes the author with the given id" do
          delete :destroy, id: author
          
          expect(Author.count).to eq(0)
        end
        
        it "sets the flash message" do
           delete :destroy, id: author
           
           expect(flash[:success]).to eq("Author has been deleted.")
        end
        
        it "redirects to the index action" do
           delete :destroy, id: author
           expect(response).to redirect_to authors_path
        end
    end
end

