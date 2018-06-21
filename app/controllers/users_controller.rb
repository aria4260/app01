class UsersController < ApplicationController
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

  def index
    @users = User.all
  end

  def show
    @user = find_user_by_verify_token
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.send_verify(@user).deliver_now
      redirect_to reg_users_path
    else
      render action: :new
    end
  end

  def reg
  end

  def auth
  end

  def auth_update
    @user.user_status = 1
    @user.save
    session[:user_id] = @user.id
    redirect_to auth_user_path(@user)
  end

  def edit
    @user = find_user_by_verify_token
    @user.image.cache! unless @user.image.blank?
  end

  def update
    @user = find_user_by_verify_token
    @user.update(user_params)
    if @user.save
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  def destroy
    @user = find_user_by_verify_token
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to root_path
  end

  def mypage
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to mypage_user_path(@user)
    else
      @error_massage = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      render action: :login_form
    end
  end

  def logout
    session[:user_id] = ""
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

    def find_user_by_verify_token
      User.find_by(verify_token: params[:verify_token])
    end

end
