class Notifier < ActionMailer::Base
  default from: "Vocabulator <vocabulator@munat.com>"

  def password_reset_request(user)
    @user = user

    mail to: @user.email, subject: "[Vocabulator] Reset your credentials"
  end

  def password_reset(user)
    @user = user

    mail to: @user.email, subject: "[Vocabulator] Your password was reset"
  end
end