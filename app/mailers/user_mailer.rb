class UserMailer < Devise::Mailer
  default from: "Kixo <info@kixo.ca>"

  before_filter :set_locale

  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => t("users.mailer.welcome_email.subject"))
  end

  private

  def set_locale
    if params[:locale].blank?
      if session[:locale]
        redirect_to "/#{session[:locale]}"
      elsif cookies[:locale]
        redirect_to "/#{cookies[:locale]}"
      elsif user_signed_in?
        redirect_to "/#{current_user.locale.code}"
      else
        browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
        if Locale.find_by_code(browser_locale)
          redirect_to "/#{browser_locale}"
        else
          redirect_to "/#{I18n.default_locale}"
        end
      end
    else
      I18n.locale = params[:locale]
      session[:locale] = cookies[:locale] = I18n.locale
    end
  end

end
