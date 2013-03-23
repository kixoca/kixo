class ApplicationController < ActionController::Base

  # I18n
  before_filter :set_locale

  before_filter :set_common_vars

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {:locale => I18n.locale}
  end

  def set_locale
    if params[:locale].blank?
      browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
      redirect_to Locale.find_by_code(browser_locale) ? "/#{browser_locale}" : "/#{I18n.default_locale}"
    else
      I18n.locale = params[:locale]
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
    @all_topics = Topic.all
    @all_professions = Profession.all
    @all_countries = Country.all
    @all_regions = Region.all
    @all_localities = Locality.all

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
