class Publics::CommentsController < ApplicationController

  def edit
    @post_favtime = PostFavtime.find(params[:post_favtime_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post_favtime = PostFavtime.find(params[:post_favtime_id])
    comment= Comment.find(params[:id])
   if comment.update(comment_params)
    redirect_to publics_post_favtime_path(@post_favtime.id)
   else
    flash.now[:danger] = "編集に失敗しました"
    render 'edit'
   end
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
      redirect_to publics_post_favtime_path(@post_favtime)
    else
      @post_favtime = PostFavtime.find(params[:post_favtime_id])
      # @comment = Comment.new
      # @post_new = PostFavtime.new
      @post_tags = @post_favtime.post_tags
      @comments = @post_favtime.comments
      # flash[:alret] = "Failed to comment"
      # render "publics/post_favtimes/show"
      redirect_to publics_post_favtime_path(@post_favtime)
      flash[:alert] = "Please enter your comment!!!"
    end
  end

  # def new
  # end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_favtime_id)
  end
end
