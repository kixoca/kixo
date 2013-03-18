class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @humanized_categories = @categories.map {|category| {:id => category.id, :name => category.name}}

    respond_to do |format|
      format.html
      format.json { render :json => @humanized_categories }
      format.xml  { render :xml => @humanized_categories }
    end
  end

  def show
    @category = Category.find(params[:id])

    @questions = @category.questions
    @professionals = @category.professionals

    @topics = @category.topics
    @professions = @category.professions

    respond_to do |format|
      format.html
      format.json { render :json => @category }
      format.xml  { render :xml => @category }
    end
  end

end
