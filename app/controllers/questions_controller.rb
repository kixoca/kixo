class QuestionsController < ApplicationController

  # filters
  before_filter :remember_question, :only => [:new, :create]
  before_filter :authenticate!,     :only => [:update, :edit, :destroy]

  def index
    @questions = Question.find_by_locale.public.

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

    respond_to do |format|
      format.html
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  def new
    @question = Question.new(session[:question])
    @author = current_user || User.new

    respond_to do |format|
      format.html
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])

    unless user_signed_in? or current_user
      if !params[:user][:email].blank? and !params[:user][:password].blank?
        # existing user
        @author = User.authenticate(params[:user][:email], params[:user][:password])
      elsif !params[:new_user][:email].blank? and !params[:new_user][:password].blank? and !params[:new_user][:password_confirmation].blank?
        # new user
        @author = User.find_or_create_by_email(params[:new_user])
      end

      if @author
        sign_in :user, @author
      else
        flash[:error] = "Invalid email or password."
        authenticate!
      end
    end

    @question.author = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question }
        format.json { render :json => @question, :status => :created, :location => @question }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html {
          flash[:success] = t(:question_was_updated)
          redirect_to @question
        }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html {
          flash[:error] = "Cannot update question!"
          render action: "edit"
        }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to_questions_url }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def authenticate!
    session[:user_return_to] = case params[:action]
                                 when "create" then new_question_path
                                 else request.path
                               end
    authenticate_user!
  end

  def remember_question
    session[:question] = params[:question] unless params[:question].nil?
  end
end
