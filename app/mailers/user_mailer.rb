class UserMailer < Devise::Mailer
  default from: "Kixo <info@kixo.ca>"

  def welcome_email(user)
    tmp_locale = I18n.locale
    @user = user
    I18n.locale = user.locale.code
    mail(:to => user.email, :subject => t("user_mailer.welcome_email.subject"))
    I18n.locale = tmp_locale
  end

  def goodbye_email(user)
    tmp_locale = I18n.locale
    @user = user
    I18n.locale = user.locale.code
    mail(:to => user.email, :subject => t("user_mailer.goodbye_email.subject"))
    I18n.locale = tmp_locale
  end

  def notify_of_question(question)
    tmp_locale = I18n.locale
    @question = question
    @users = question.locale.users.find_all_by_topic(question.topics).where(:notify_of_questions => true)
    @users.each do |user|
      @user = user
      I18n.locale = user.locale.code
      mail(:to => user.email, :subject => t("user_mailer.notify_of_question.subject"))
    end
    I18n.locale = tmp_locale
  end

end
