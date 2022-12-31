class SearchsController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    
    if @range == "user"
      @users = User.looks(params[:seach], params[:wprd])
      render "searchs/search_result"
    else
      @books = Book.looks(params[:search], params[:word])
      render "searchs/search_result"
      
    end
   
  end
end
