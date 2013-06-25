class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_admin

  def index
    @questions = Question.order("created_at DESC")
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html do
          flash[:success] = t("admin.question.update.success")
          redirect_to edit_admin_question_path(@question)
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html do
          flash[:error] = t("admin.question.update.error")
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
      format.html do
        if @question.destroy
          flash[:success] = t("admin.question.destroy.success")
          redirect_to admin_questions_path
        else
          flash[:error] = t("admin.question.destroy.error")
          redirect_to edit_admin_question_path(@question)
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
end
