class Publics::PostFavtimesController < ApplicationController
  def show
    @post_favtime = PostFavtime.find(params[:id])
    @comment = Comment.new
    @comments =  @post_favtime.comments
    @post_tags = @post_favtime.post_tags
  end

  def edit
    @post_favtime = PostFavtime.find(params[:id])
    redirect_to(publics_post_favtimes_path) unless @post_favtime.user == current_user
  end

  def update
    @post_favtime = PostFavtime.find(params[:id])
    @post_favtime.update(post_favtime_params)
    redirect_to publics_post_favtime_path(@post_favtime.id)
  end

  def index
    @post_favtimes = PostFavtime.all
    @tag_list = PostTag.all
    @post_favtime = PostFavtime.new
    @comments = Comment.all
  end

  def destroy
   @post_favtime = PostFavtime.find(params[:id])
   @post_favtime.destroy
   redirect_to publics_post_favtimes_path(@post_favtime.id)
  end

  def new
    @post_favtime = PostFavtime.new
    @post_favtime = current_user.post_favtimes.new
  end

  def create
    @post_favtime = current_user.post_favtimes.new(post_favtime_params)
    post_tag_list = params[:post_favtime][:tag_name].split(nil)
    if @post_favtime.save
      @post_favtime.save_tag(post_tag_list)
      redirect_to publics_post_favtime_path(current_user)
    else
      redirect_to new_publics_post_favtime_path
    end
  end

  private
  # ストロングパラメータ
  def post_favtime_params
    params.require(:post_favtime).permit(:title, :introduction, :image, :user_id)
  end


end
