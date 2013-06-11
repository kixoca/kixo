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
    unless @users.empty?
      @users.each do |user|
        @user = user
        I18n.locale = user.locale.code
        mail(:to => user.email, :subject => t("user_mailer.notify_of_question.subject"))
      end
    end
    I18n.locale = tmp_locale
  end

  def notify_of_answer(answer)
    tmp_locale = I18n.locale
    @answer = answer
    @question = @answer.question
    @user = @question.author
    @author = @answer.author
    I18n.locale = @user.locale.code
    mail(:to => @user.email, :subject => t("user_mailer.notify_of_answer.subject"))
    I18n.locale = tmp_locale
  end

  def notify_of_message(message)
    tmp_locale = I18n.locale
    @message = message
    @conversation = message.conversation
    @author = message.author
    users = @conversation.other_participants(@author)
    unless users.empty?
      users.each do |user|
        @user = user
        I18n.locale = user.locale.code
        mail(:to => user.email, :subject => t("user_mailer.notify_of_message.subject"))
      end
    end
    I18n.locale = tmp_locale
  end

  def weekly_questions_email
    tmp_locale = I18n.locale
    @users = User.where(:notify_of_kixo_news => true)
    unless @users.empty?
      @users.each do |user|
        @user = user
        @questions = Question.where(:locale_id => user.locales).where("created_at > ?", 7.days.ago).limit(5).order("created_at DESC")
        unless @questions.empty?
          I18n.locale = user.locale.code
          mail(:to => user.email, :subject => t("user_mailer.weekly_questions_email.subject"))
        end
      end
    end
    I18n.locale = tmp_locale
  end

end
