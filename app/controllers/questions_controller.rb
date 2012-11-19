class QuestionsController < ApplicationController

  # filters
  before_filter :remember_question, :only => [:new]
  before_filter :authenticate!,     :only => [:update, :edit, :create, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.by_locale.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @questions }
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @question }
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new(session[:question])
    @categories = Category.all

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
  def create
    @question = Question.new(params[:question])

    @question.user = current_user unless current_user.nil?

    @categories = Category.all

    logger.debug "New question: #{@question.attributes.inspect}"
    logger.debug "Question should be valid: #{@question.valid?}"

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
    session[:user_return_to] = request.path
    authenticate_user!
  end

  def remember_question
    session[:question] = params[:question] unless params[:question].nil?
  end

end
