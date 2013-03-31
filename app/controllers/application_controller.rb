class ApplicationController < ActionController::Base

  # I18n
  before_filter :set_locale

  before_filter :set_common_vars

  def default_url_options(options={})
    {:locale => I18n.locale}
  end

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

  # Devise extras
  def authenticate_user(email, password)
    user = User.find_by_email(email)
    user.valid_password?(password) unless user.nil?
  end

  def set_common_vars
    # taxonomies
    @all_categories = Category.all
    @top_categories = Category.most_popular
    @all_topics = Topic.all
    @top_topics = Topic.most_popular
    @all_professions = Profession.all
    @top_professions = Profession.most_popular
    @all_countries = Country.all
    @all_regions = Region.all
    @all_localities = Locality.all
    @top_localities = Locality.most_popular

    # locales
    @all_locales = Locale.all

    # misc.
    @all_ratings = Rating.all

    # stripe
    @new_card = Card.new

    # messages
    if current_user
      @new_conversation = Conversation.new
      @new_conversation.messages.build
    end
  end

end
