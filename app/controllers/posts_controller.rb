class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿完了しました"
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:comment, :photo_date, :publish, :tag_list, photos_attributes: [:image],)
    end

end
