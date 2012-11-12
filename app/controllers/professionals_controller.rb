class ProfessionalsController < ApplicationController

  # GET /professionals
  # GET /professionals.json
  def index
    unless params[:where].blank?
      @where = params[:where]
    else
      @where = [request.location.latitude, request.location.longitude]
    end

    unless params[:what].blank?
      @what = params[:what]
      @topics = Topic.search(@what)
      @professions = Profession.search(@what)
      @professionals = Professional.find(@what, @where)
    else
      @professionals = Professional.all
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @questions }
      format.xml  { render :xml => @questions }
    end
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
    @professional = Professional.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @professional }
      format.xml  { render :xml => @professional }
    end
  end

end
