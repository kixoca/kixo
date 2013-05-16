class Admin::AdsController < ApplicationController
  before_filter :authenticate_admin

  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new(params[:ad])
  end
end
