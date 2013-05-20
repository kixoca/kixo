module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def display_url(url)
    url.gsub("http://", "").gsub("https://", "") unless url.blank?
  end

  def twitter_url(username)
    "http://twitter.com/#{username}"
  end

  def facebook_url(url)
    "http://www.facebook.com/#{url}"
  end

end
