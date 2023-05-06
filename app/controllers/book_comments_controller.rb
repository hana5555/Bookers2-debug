class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    #BookComment.book_id = @book.id
    comment.save
    @user = @book.user
    render 'books/show'
    #comment.book_id = book.id
  end

  def destroy
    BookComment.find(params[:id]).destroy
  #  redirect_to book_path(params[:book_id])

    #renderしたときに@bookのデータがないため定義
    @book = Book.find(params[:book_id])
    render :comments #render先にjsファイルを指定
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
