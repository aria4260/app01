class HomeController < ApplicationController

  def top
    @posts = Post.limit(20).order(created_at: :desc)
  end
end
