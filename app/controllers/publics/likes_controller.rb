class Publics::LikesController < ApplicationController
  def create
    post_like = Like.new(user_id: current_user.id, post_favtime_id: params[:post_favtime_id])
    post_like.save
    redirect_to publics_post_favtime_path(params[:post_favtime_id])
  end

  def destroy
    post_like = Like.find_by(user_id: current_user.id, post_favtime_id: params[:post_favtime_id])
    post_like.destroy
    redirect_to publics_post_favtime_path(params[:post_favtime_id])
  end
end
