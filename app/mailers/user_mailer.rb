class UserMailer < ApplicationMailer
  def send_verify(user)
    @user = users
    mail to: @user.email, subject: 'タイトル'
  end
end
