class PagesController < ApplicationController
  def index
    if current_user
      @questions = Question.joins(:topics).where(:conditions => {:taxonomies => {:id => current_user.topics}})
    else
      @questions = Question.find_all_by_locale
    end

    @questions = @questions.uniq.order("created_at DESC").page(params[:page]) unless @questions.nil?
  end
end
