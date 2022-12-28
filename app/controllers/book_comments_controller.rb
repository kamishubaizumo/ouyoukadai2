class BookCommentsController < 
  
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_prams)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
    
  end
  
  def destroy
  end

  private
  
  def book_comments_params
    params.require(:book_comment).permit(:comment)
    
  end

end
