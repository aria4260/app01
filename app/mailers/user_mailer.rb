class UserMailer < ApplicationMailer
  def send_verify(user)
    @user = user
    mail to: @user.email, subject: 'タイトル'
  end
end
