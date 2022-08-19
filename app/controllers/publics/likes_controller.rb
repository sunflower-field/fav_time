class Publics::LikesController < ApplicationController
  def create
    post_favtime = PostFavtime.find(params[:post_favtime_id])
    like = current_user.likes.new(post_favtime_id: post_favtime.id)
    like.save
    redirect_to publics_post_favtime_path(post_favtime)
  end

  def destroy
    post_favtime = PostFavtime.find(params[:post_favtime_id])
    like = current_user.likes.find_by(post_favtime_id: post_favtime.id)
    like.destroy
    redirect_to publics_post_favtime_path(post_favtime)
  end
end
