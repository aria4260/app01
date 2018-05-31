class UserMailer < ApplicationMailer
  def send_verify(user)
    @user = user
    mail to: @user.email, subject: '【○○○○○】ユーザー登録完了メール'
  end
end
