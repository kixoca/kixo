class ProfessionsController < ApplicationController

  def index
    @category = Category.find(params[:category_id]) unless params[:category_id].nil?
    @professions = @category ? @category.professions : Profession.all

    @humanized_professions = @professions.map {|profession| {:id => profession.id, :name => profession.name}}

    respond_to do |format|
      format.html # search.html.haml
      format.json { render :json => @humanized_professions }
      format.xml  { render :xml => @humanized_professions }
    end
  end

  def show
    @profession = Profession.find(params[:id])

    @professionals = @profession.professionals

    unless params[:locality_id].nil?
      @locality = Locality.find(params[:locality_id])
      @professionals = @professionals.merge(@locality.professionals) unless @locality.nil?
    end

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @profession }
      format.xml  { render :xml => @profession }
    end
  end

end
