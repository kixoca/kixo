class UserMailer < Devise::Mailer
  default from: "Kixo <info@kixo.ca>"

  def welcome_email(user)
    @user = user
    @locale = user.locale.code
    mail(:to => user.email, :subject => t("users.mailer.welcome_email.subject"))
  end

  def notify_of_question(question)
    @question = question
    @users = User.where(:notify_of_questions => true)
    @users.each do |user|
      @user = user
      @locale = user.locale.code
      mail(:to => user.email, :subject => t("users.mailer.notify_of_question.subject"))
    end
  end

end
