class UsersController < ApplicationController

  def index
    @users = Array.new

    unless params[:where].blank?
      @where = params[:where]

      unless params[:what].blank?
        @what = params[:what]
        @topics = Topic.search(@what)
        @professions = Profession.search(@what)
        @users = User.search(@what, @where)
      end
    end

    # pagination
    if @users.kind_of?(Array)
      Kaminari.paginate_array(@users).page(params[:page])
    else
      @users.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @answers = @user.answers.page(params[:page])
    @reviews = @user.reviews.page(params[:page])
    @guides = @user.guides.page(params[:page])
    @similar_users = @user.similar

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
    end
  end

end
