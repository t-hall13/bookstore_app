class Admin::BooksController < Admin::BaseController
   before_action :require_signin 
   before_action :require_admin
   before_action :set_book, except: [:index, :new, :create]
   def index
   end
   
   def show
     
   end
  
   def new
      @book = Book.new 
      @book.publications.build
      
      @publishers = Publisher.all
      @authors = Author.all
   end
   
   def create
      @book = Book.new(book_params)
      if @book.save
         flash[:success]= "Book has been created."
         redirect_to [:admin, @book ]
      else
         flash.now[:danger]= "Book has not been created."
          @publishers = Publisher.all
             @authors = Author.all
         render :new
      end
   end
   
   def edit
     
   end
   
   def update 
      if @book.update(book_params)
         flash[:success] = "Book has been updated."
         redirect_to [:admin, @book ]
      else
         flash[:danger] = "Book has not been updated."
         render :edit
      end
   end
   
   def destroy
      @book.destroy
      flash[:success] = "Book has been deleted."
      redirect_to admin_books_path
   end
   
   private
   def book_params
      params.require(:book).permit(:title, :isbn, :price, :page_count, :description, 
      :published_at, :publisher_id, :book_cover, author_ids:[]) 
   end
   
   def set_book
       @book = Book.find(params[:id]) 
   end
end