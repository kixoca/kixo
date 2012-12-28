class AnswersController < ApplicationController

  # filters
  before_filter :remember_answer, :only => [:new]
  before_filter :authenticate!,   :only => [:update, :edit, :create, :destroy]

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @answers }
      format.xml  { render :xml => @answers }
    end
  end

  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @answer }
      format.xml  { render :xml => @answer }
    end
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.author = current_professional

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question }
        format.json { render :json => @answer, :status => :created, :location => @answer }
        format.xml  { render :xml => @answer, :status => :created, :location => @answer }
      else
        format.html { redirect_to @answer.question }
        format.json { render :json => @answer.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html {
          flash[:success] = t(:answer_was_updated)
          redirect_to @question
        }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html {
          flash[:error] = "Cannot update review!"
          redirect_to @question
        }
        format.json { render :json => @answer.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to @question }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def authenticate!
    session[:user_return_to] = request.path
    authenticate_professional!
  end

  def remember_answer
    session[:answer] = params[:answer] unless params[:answer].nil?
  end

end
