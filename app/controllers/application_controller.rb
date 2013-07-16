class ApplicationController < ActionController::Base
  before_filter :set_locale
  before_filter :set_common_vars

  before_filter :validate_acceptance

  around_filter :append_event_tracking_tags

  def default_url_options(options={})
    {:locale => I18n.locale}
  end

  def set_locale
    if params[:locale].blank?
      if user_signed_in?
        locale = current_user.locale.code
      elsif session[:locale]
        locale = session[:locale]
      elsif cookies[:locale]
        locale = cookies[:locale]
      else
        browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
        if Locale.find_by_code(browser_locale)
          locale = browser_locale
        else
          locale = I18n.default_locale
        end
      end
      redirect_to "/#{locale}"
    else
      if user_signed_in? && params[:locale] != current_user.locale.code
        redirect_to url_for(:locale => current_user.locale.code)
      else
        I18n.locale = params[:locale]
        session[:locale] = cookies[:locale] = I18n.locale
      end
    end
  end

  def authenticate_user(email, password)
    user = User.find_by_email(email)
    user.valid_password?(password) unless user.nil?
  end

  def authenticate_professional
    redirect_to(root_path) unless (user_signed_in? and current_user.is_professional?)
  end

  def authenticate_admin
    redirect_to(root_path) unless (user_signed_in? and current_user.is_admin?)
  end

  def set_common_vars
    # professions
    @all_categories  = Category.all
    @all_topics      = Topic.all
    @all_professions = Profession.all
    @all_countries   = Country.all
    @all_regions     = Region.all
    @all_localities  = Locality.all

    @top_categories  = Category.most_popular
    @top_topics      = Topic.most_popular
    @top_professions = Profession.most_popular
    @top_localities  = Locality.most_popular

    @user_locale = user_signed_in? ? current_user.locales : Locale.find_by_code(I18n.locale)

    # locales
    @all_locales   = Locale.all
    @other_locales = Locale.all(:conditions => ["id !=?", Locale.find_by_code(I18n.locale)])

    @all_pages = Page.all

    # misc.
    @all_ratings = Rating.all

    # stripe
    @new_card = Card.new

    # messages
    @new_conversation = Conversation.new
    @new_conversation.messages.build
  end

  def validate_acceptance
    if user_signed_in? && !current_user.accepts && !session[:validate_acceptance]
      session[:validate_acceptance] = true
      flash[:alert] = I18n.t("misc.validate_accepts")
      redirect_to edit_user_registration_path
    end
  end

  def mixpanel_distinct_id
    Rails.cache.fetch("current_user.mixpanel_id") { current_user.mixpanel_id if current_user }
  end

  def mixpanel_name_tag
    Rails.cache.fetch("current_user.mixpanel_name_tag") { current_user && current_user.email }
  end
end
