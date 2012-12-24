class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])

    @questions = @topic.questions
    @professionals = @topic.professionals

    unless params[:locality_id].nil?
      @locality = Locality.find(params[:locality_id])
      @professionals = @professionals.merge(@locality.professionals) unless @locality.nil?
    end

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @topic }
      format.xml  { render :xml => @topic }
    end
  end

end
