class FavoritesController < ApplicationController



  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
  #  redirect_to book_path(book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  #  redirect_to book_path(book)
  end

    #お気に入り一覧表示
  def favorites
   # favorites = Favorite.find(params[:book_id])

  end

end
