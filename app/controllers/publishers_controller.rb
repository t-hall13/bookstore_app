class PublishersController < ApplicationController
    def index
    
    end
    
    def show
        @publisher = Publisher.find(params[:id])
    end
    
    def new
        @publisher = Publisher.new
    end
    
    def create
        @publisher = Publisher.new(publisher_params)
        if @publisher.save
            flash[:success]= "Publisher has been created."
            redirect_to @publisher
        else
            flash[:danger]= "Publisher has not been created."
            render :new
        end
    end
    
    private
    def publisher_params
        params.require(:publisher).permit(:name)
    end
end