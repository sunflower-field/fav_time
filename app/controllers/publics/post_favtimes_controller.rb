class Publics::PostFavtimesController < ApplicationController
  def show
    @post_favtimes = PostFavtime.all
    @post_favtime = PostFavtime.find(params[:id])
  end

  def edit
    @post_favtime = PostFavtime.find(params[:id])
  end

  def update
    @post_favtime = PostFavtime.find(params[:id])
    @post_favtime.update(post_favtime_params)
    redirect_to publics_post_favtime_path(@post_favtime.id)
  end

  def index
    @post_favtimes = PostFavtime.all
  end

  def destroy
  end

  def new
    @post_favtime = PostFavtime.new
  end

  def create
    @post_favtime = PostFavtime.new(post_favtime_params)
    @user = current_user
    @post_favtime.user = @user
    @post_favtime.save
    redirect_to  publics_post_favtime_path(@post_favtime)
  end

  private
  # ストロングパラメータ
  def post_favtime_params
    params.require(:post_favtime).permit(:title, :introduction, :image, :user_id)
  end


end
