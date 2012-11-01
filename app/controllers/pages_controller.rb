class PagesController < ApplicationController

  def index

    @question = Question.new

    @user = User.new unless user_signed_in?

    @categories = Category.all
    @topics = Topic.all
    @professions = Profession.all

    @latest_questions = Question.all

  end

end
