class PagesController < ApplicationController

  def index

    @categories = Category.all
    @topics = Topic.all
    @professions = Profession.all

    @latest_questions = Question.all

  end

end
