class Publics::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    # @post_favtimes = PostFavtime.search(params[:keyword])
    @post_favtimes = @user.post_favtimes
    if @suggest_favtime.nil?
      @suggest_favtime = nil
    else
      @suggest_favtime = PostFavtime.offset( rand(PostFavtime.count) ).first
    end
  end

  # def search
  #   @post_favtimes = PostFavtime.search(params[:keyword])
  # end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to publics_user_path(@user.id)
      # , notice: 'You have updated user successfully.'
    else
      render "edit"
    end
  end

  def index
  end

  def withdrawal
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def unscribe
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end
end

