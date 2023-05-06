class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id]) #コメントを投稿されるユーザー見つける
    comment = current_user.book_comments.new(book_comment_params) #ログインユーザーがコメントを作成する
    comment.book_id = @book.id #新規コメントと、投稿されるユーザーを一致させる
    comment.save #コメントを保存する
    @user = @book.user
    #@book_comment = BookComment.new
    #render 'books/show'
    render :comments
  end

  def destroy
    @book = Book.find(params[:book_id])
    #@book_comment = BookComment.new
    BookComment.find(params[:id]).destroy
    #comment.destroy
    #renderしたときに@bookのデータがないため定義
    render :comments #render先にjsファイルを指定
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
