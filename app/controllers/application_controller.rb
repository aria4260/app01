class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #ログインしていない場合
  def authenticate_user
    if @current_user == ""
      flash[:notice] = "ログインが必要です"
      redirect_to login_path
    end
  end

  #ログインしている場合
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to root_path
    end
  end

end
