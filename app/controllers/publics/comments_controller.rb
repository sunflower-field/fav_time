class Publics::CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment= Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to publics_post_favtime_comment_path(comment.id)
  end

  def destroy
    @post_favtime = PostFavtime.find(params[:post_favtime_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  def create
    @post_favtime = PostFavtime.find(params[:post_favtime_id])
    @comment = @post_favtime.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      @post_new = PostFavtime.new
      @comments = @post_favtime.comments
      redirect_to publics_post_favtime_post_comment_path
    end
  end

  def new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_favtime_id)
  end
end
