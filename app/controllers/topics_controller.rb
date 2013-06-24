class TopicsController < ApplicationController

  def index
    @category = Category.find(params[:category_id]) unless params[:category_id].nil?
    @topics = @category ? @category.topics : Topic.all

    @humanized_topics = @topics.map {|topic| {:id => topic.id, :name => topic.name}}

    respond_to do |format|
      format.html
      format.json { render :json => @humanized_topics }
      format.xml  { render :xml => @humanized_topics }
    end
  end

  def show
    @topic = Topic.find(params[:id])

    @questions = @topic.questions.find_all_by_locale(@user_locale)
    @professionals = @topic.professionals

    unless params[:locality_id].nil?
      @locality = Locality.find(params[:locality_id])
      @professionals = @professionals.merge(@locality.professionals) unless @locality.nil?
    end

    respond_to do |format|
      format.html
      format.json { render :json => @topic }
      format.xml  { render :xml => @topic }
    end
  end

end
