class PageController < ApplicationController

  def index

    @latest_questions = Question.all

  end

end
