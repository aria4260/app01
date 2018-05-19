class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
      image: "dafault_user.jpg"
    )
    if @user.save
      redirect_to("/")
    else
      render("/users/new")
    end
  end
end
