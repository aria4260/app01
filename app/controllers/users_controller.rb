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
    @user = User.new(user_params)
    if @user.save
      UserMailer.send_verify(@user).deliver_now
      redirect_to(root_path)
    else
      render(new_user_path)
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :image)
    end
end
