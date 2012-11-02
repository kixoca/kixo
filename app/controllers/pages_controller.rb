class PagesController < ApplicationController

  def index

    @latest_questions = Question.all

  end

end
