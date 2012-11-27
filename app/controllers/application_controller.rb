class ApplicationController < ActionController::Base

  # I18n
  before_filter :set_locale

  # Set correct header action tab
  before_filter :set_current_action_tab

  before_filter :set_common_vars

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_current_action_tab
    if params[:action] == "index"
      @current_action_tab = case params[:controller]
        when "questions"     then "ask"
        when "professionals" then "find"
        when "reviews"       then "review"
        else "ask"
      end
    else
      @current_action_tab = ""
    end
  end

  # Devise extras
  def authenticate_user(email, password)
    user = User.find_by_email(email)
    user.valid_password?(password) unless user.nil?
  end

  def set_common_vars
    @all_categories = Category.by_locale
    @all_topics = Topic.by_locale
    @all_professions = Profession.by_locale
  end

end
