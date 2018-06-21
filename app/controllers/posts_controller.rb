class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
    @post.photos.build
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿完了しました"
      redirect_to mypage_user_path(@current_user)
    else
      render action: :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @post.photos.cache! unless @post.photos.image.blank?
  end


  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:comment, :photo_date, :publish, :tag_list, photos_attributes: [:id, :image, :_destroy])
    end

end
