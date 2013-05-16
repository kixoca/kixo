class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_admin

  def index
    @questions = Question.all
  end
end
