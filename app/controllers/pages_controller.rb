class PagesController < ApplicationController

  def index

    if current_professional
      @questions = Question.joins(:topics).where(:conditions => {:topics => {:id => current_professional.topics}})
    else
      @questions = Question.by_locale
    end

    @questions = @questions.order("created_at DESC").page(params[:page]) unless @questions.nil?
  end

end
