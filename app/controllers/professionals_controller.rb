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
      @professionals = Professional.search(@what, @where)
    else
      @professionals = Professional.all
    end

    # pagination
    if @professionals.kind_of?(Array)
      Kaminari.paginate_array(@professionals).page(params[:page])
    else
      @professionals.page(params[:page])
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
    @answers = @professional.answers.page(params[:page])
    @reviews = @professional.reviews.page(params[:page])
    @guides = @professional.guides.page(params[:page])
    @ratings = Rating.all
    @similar_professionals = @professional.similar

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @professional }
      format.xml  { render :xml => @professional }
    end
  end

end
