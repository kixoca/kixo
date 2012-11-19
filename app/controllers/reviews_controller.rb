class ReviewsController < ApplicationController

  # filters
  before_filter :remember_review, :only => [:new]
  before_filter :authenticate!,   :only => [:update, :edit, :create, :destroy]

  def index
    @professional = Professional.find(params[:professional_id])
    @reviews = @professional.reviews.by_locale

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @reviews }
      format.xml  { render :xml => @reviews }
    end
  end

  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @review }
      format.xml  { render :xml => @review }
    end
  end

  def create
    @review = Review.new(params[:review])
    @review.user = current_user unless current_user.nil?

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.professional }
        format.json { render :json => @review, :status => :created, :location => @review }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
      else
        format.html { redirect_to @review.professional }
        format.json { render :json => @review.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html {
          flash[:success] = t(:review_was_updated)
          redirect_to @review
        }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html {
          flash[:error] = "Cannot update review!"
          render action: "edit"
        }
        format.json { render :json => @review.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @professional = @review.professional
    @review.destroy

    respond_to do |format|
      format.html { redirect_to professional_path(@professional) }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def authenticate!
    session[:user_return_to] = request.path
    authenticate_user!
  end

  def remember_review
    session[:review] = params[:review] unless params[:review].nil?
  end

end
