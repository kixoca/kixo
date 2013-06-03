class QuestionsController < ApplicationController
  before_filter :remember_question,  :only => [:new, :create]
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy]
  before_filter :verify_if_author!,  :only => [:edit, :update, :destroy]

  def index
    @questions = Question.find_by_locale.public

    respond_to do |format|
      format.html
      format.json { render :json => @questions }
      format.xml  { render :xml => @questions }
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @author = @question.author
    @topics = @question.topics
    @related_professionals = User.professionals.find_all_by_topic(@topics)

    track_event "View Question"

    @page_title = t("questions.show.page_title", :question => @question.title)

    respond_to do |format|
      format.html
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  def new
    @question = Question.new(params[:question])
    @author = current_user || User.new

    track_event "New Question"

    respond_to do |format|
      format.html
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  def edit
    @question = Question.find(params[:id])

    track_event "Edit Question"
  end

  def create
    @question = Question.new(params[:question])

    unless user_signed_in?
      if !params[:existing_user][:email].blank? and !params[:existing_user][:password].blank?
        # existing user
        @author = User.authenticate(params[:existing_user][:email], params[:existing_user][:password])
      elsif !params[:new_user][:email].blank? and !params[:new_user][:password].blank? and !params[:new_user][:password_confirmation].blank?
        # new user
        @author = User.new(params[:new_user])

        if @author.save
          flash[:success] = I18n.t("users.registrations.create.success")
        else
          flash[:error] = I18n.t("users.registrations.create.error")
          render :action => "new"
        end
      end

      sign_in :user, @author if @author
    end

    if user_signed_in?
      @question.author = @author || current_user

      respond_to do |format|
        if @question.save
          track_event "Create Question"
          format.html do
            flash[:success] = I18n.t("questions.create.success")
            redirect_to @question
          end
          format.json { render :json => @question, :status => :created, :location => @question }
          format.xml  { render :xml => @question, :status => :created, :location => @question }
        else
          track_event "Create Question (Error)"
          format.html do
            flash[:error] = I18n.t("questions.create.error")
            render :action => "new"
          end
          format.json { render :json => @question.errors, :status => :unprocessable_entity }
          format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        track_event "Update Question"
        format.html do
          flash[:success] = t("questions.update.success")
          redirect_to @question
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        track_event "Update Question (Error)"
        format.html do
          flash[:error] = t("questions.update.error")
          render action: "edit"
        end
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])

    respond_to do |format|
      track_event "Destroy Question"
      format.html do
        if @question.destroy
          flash[:success] = I18n.t("questions.delete.success")
          redirect_to root_path
        else
          flash[:error] = I18n.t("questions.delete.error")
          redirect_to @question
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def verify_if_author!
    question = Question.find(params[:id])
    if question.author != current_user
      flash[:error] = t("security.access_denied")
      redirect_to question
    end
  end

  def remember_question
    session[:question] = params[:question] unless params[:question].nil?
  end
end
