class ProfessionsController < ApplicationController

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
