class ProfessionalsController < ApplicationController

  def index
    if params[:term]
      @professionals = User.professionals.lookup(params[:term])
    else
      @professionals = User.professionals.all
    end

    # pagination
    if @professionals.kind_of?(Array)
      Kaminari.paginate_array(@professionals).page(params[:page])
    else
      @professionals.page(params[:page])
    end

    @humanized_professionals = @professionals.map {|professional|
      {
          :id    => professional.id,
          :name  => professional.name,
          :label => "#{professional.name} (#{professional.professions_list} in #{professional.locality.name})"
      }
    }

    respond_to do |format|
      format.html
      format.json { render :json => @humanized_professionals }
      format.xml  { render :xml  => @humanized_professionals }
    end
  end

  def search
    @professionals = Array.new
    @where = params[:where]
    @what = params[:what]

    unless @where.blank?
      @nearby_localities = Locality.near(@where).limit(15)

      unless @what.blank?
        @related_topics = Topic.search(@what, Locale.all)
        @related_professions = Profession.search(@what, Locale.all)

        @professionals = User.professionals.search(@what, @where)
      end
    end

    # pagination
    if @professionals.kind_of?(Array)
      Kaminari.paginate_array(@professionals).page(params[:page])
    else
      @professionals.page(params[:page])
    end

    @current_action_tab = "search"

    respond_to do |format|
      format.html
      format.json { render :json => @professionals }
      format.xml  { render :xml  => @professionals }
    end
  end

  def show
    @professional = User.find(params[:id])

    @answers = @professional.answers.page(params[:page])
    @reviews = @professional.reviews.page(params[:page])
    @guides = @professional.guides.page(params[:page])

    @similar_professionals = @professional.similar_professionals

    @page_title = t("professionals.show.page_title", :professional => @professional.name)

    respond_to do |format|
      format.html
      format.json { render :json => @professional }
      format.xml  { render :xml  => @professional }
    end
  end

end
