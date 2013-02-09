class UsersController < ApplicationController

  def index
    @professionals = Array.new

    @where = params[:where]
    @what = params[:what]

    unless @where.blank?
      @nearby_localities = Locality.near(@where).limit(15)

      unless @what.blank?
        @related_topics = Topic.search(@what)
        @related_professions = Profession.search(@what)

        @professionals = User.professionals.search(@what, @where)
      end
    end

    # pagination
    if @professionals.kind_of?(Array)
      Kaminari.paginate_array(@professionals).page(params[:page])
    else
      @professionals.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @professionals }
      format.xml  { render :xml => @professionals }
    end
  end

  def show
    @user = User.find(params[:id])
    @answers = @user.answers.page(params[:page])
    @reviews = @user.reviews.page(params[:page])
    @guides = @user.guides.page(params[:page])

    @similar_professionals = @user.similar.professionals if @user.is_a_professional?

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
    end
  end

end
