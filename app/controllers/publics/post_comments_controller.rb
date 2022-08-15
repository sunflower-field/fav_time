class Publics::PostCommentsController < ApplicationController
  def edit
  end

  def update
  end

  def destroy
  end

  def create
    post_favtime = PostFavtime.find(params[:post_favtime_id])
    post_comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def new
  end
end
