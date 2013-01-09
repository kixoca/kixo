class QuestionsController < ApplicationController

  # filters
  before_filter :remember_question, :only => [:new, :create]
  before_filter :authenticate!,     :only => [:create, :update, :edit, :destroy]

  # GET /questions
  # GET /questions.json
  # GET /questions.xml
  def index
    @questions = Question.find_all_by_locale.order("created_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @questions }
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @author = @question.author
    @topics = @question.topics
    @related_users = User.find_all_by_topic(@topics)

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  # GET /questions/new.xml
  def new
    @question = Question.new(session[:question])

    respond_to do |format|
      format.html # new.html.haml
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  # POST /questions.xml
  def create
    @question = Question.new(params[:question])
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

  # PUT /questions/1
  # PUT /questions/1.json
  # PUT /questions/1.xml
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

  # DELETE /questions/1
  # DELETE /questions/1.json
  # DELETE /questions/1.xml
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
                                 when "create"  then new_question_path
                                 else request.path
                               end
    authenticate_user!
  end

  def remember_question
    session[:question] = params[:question] unless params[:question].nil?
  end
end
