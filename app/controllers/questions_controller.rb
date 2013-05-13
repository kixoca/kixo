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
    @question = Question.new(params[:question])
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
          clean_up_passwords @author
          flash[:error] = I18n.t("users.registrations.create.error")
          render :action => "new"
        end
      end

      sign_in :user, @author
    end

    @question.author = current_user

    # assigns author's locality to question's locality if none is provided
    @question.locality = @question.author.locality if @question.locality.blank?

    respond_to do |format|
      if @question.save
        format.html do
          flash[:success] = I18n.t("questions.create.success")
          redirect_to @question
        end
        format.json { render :json => @question, :status => :created, :location => @question }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html do
          flash[:error] = I18n.t("questions.create.error")
          render :action => "new"
        end
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

    respond_to do |format|
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
