class Publics::PostFavtimesController < ApplicationController

  def show
    @post_favtime = PostFavtime.find(params[:id])
    @comment = Comment.new
    @comments =  @post_favtime.comments
    @post_tags = @post_favtime.post_tags
  end

  def edit
    @post_favtime = PostFavtime.find(params[:id])
    @tag_list = @post_favtime.post_tags.pluck(:tag_name).join(nil)
    redirect_to(publics_post_favtimes_path) unless @post_favtime.user == current_user
  end

  def update
    @post_favtime = PostFavtime.find(params[:id])
    tag_list = params[:post_favtime][:tag_name].split(nil)
    if @post_favtime.update(post_favtime_params)
      old_relations = TagMiddle.where(post_favtime_id: @post_favtime.id)
      old_relations.each do |relation|
        relation.delete
      end
      @post_favtime.save_tag(tag_list)
      redirect_to publics_post_favtime_path(@post_favtime.id)
      # , notice:'投稿完了しました:)'
    else
      redirect_to :action => "edit"
    end
  end

  def index
    if params[:post_tag_id].present?
       post_tag = PostTag.find(params[:post_tag_id])
       @post_favtimes = post_tag.post_favtimes
    else
       @post_favtimes = PostFavtime.all
    end

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
    # @post_favtime = current_user.post_favtimes.new
  end

  def create
    @post_favtime = current_user.post_favtimes.new(post_favtime_params)
    tag_list = params[:post_favtime][:tag_name].split(nil)
    if @post_favtime.save
      @post_favtime.save_tag(tag_list)
      redirect_to publics_post_favtimes_path
    else
      redirect_to new_publics_post_favtime_path
    end
  end

  def search
    if params[:keyword] != nil
      @post_favtimes = PostFavtime.search(params[:keyword])
    elsif params[:post_tag_id] != nil
      @tag_list = PostTag.all
   　　@tag = Tag.find(params[:tag_id])
      @post_favtimes = @tag.post_favtimes.all
    else
  　　　 @post_favtimes = PostFavtime.all
    end
  end

  def search
    if params[:keyword] != nil
      @post_favtimes = PostFavtime.search(params[:keyword])
    elsif params[:post_tag_id] != nil
      @tag_list = Tag.all
      @tag = PostTag.find(params[:post_tag_id])
      @post_favtimes = @tag.post_favtimes.all
    else
      @post_favtimes = PostFavtime.all
    end
  end

  private
  # ストロングパラメータ
  def post_favtime_params
    params.require(:post_favtime).permit(:title, :introduction, :image, :user_id)
  end
end