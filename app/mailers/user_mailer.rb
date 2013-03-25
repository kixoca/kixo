class UserMailer < Devise::Mailer
  default from: "Kixo <info@kixo.ca>"

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => t("users.mailer.welcome_email.subject"))
  end
end
