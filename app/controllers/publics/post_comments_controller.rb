class Publics::PostCommentsController < ApplicationController
  def edit
  end

  def update
  end

  def destroy
    PostComment.find_by(id: params[:id], post_favtime: params[:post_favtime_id]).destroy
    redirect_to publics_post_favtime_path(params[:post_favtime_id])
  end

  def create
    post_favtime = PostFavtime.find(params[:post_favtime_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.post_favtime_id = post_favtime.id
    post_comment.save
    redirect_to publics_post_favtime_path(post_favtime)
  end

  def new
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:post_comment, :user_id, :favtime_id)
  end
end
