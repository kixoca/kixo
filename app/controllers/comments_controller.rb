class CommentsController < ApplicationController
  # filters
  before_filter :authenticate!, :only => [:update, :edit, :create, :destroy]

  def show
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    respond_to do |format|
      format.html
      format.json { render :json => @comment }
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.author = current_user
    @commentable = @comment.commentable

    respond_to do |format|
      if @comment.save
        format.html do
          if request.xhr?
            render "comments/shared/loop", :comment => @comment
          else
            redirect_to @commentable
          end
        end
        format.json { render :json => @comment, :status => :created, :location => @comment }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html do
          if request.xhr?
            render :json => @comment.errors, :status => :unprocessable_entity
          else
            render :action => :new, :status => :unprocessable_entity
          end
        end
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html {
          flash[:success] = t("comments.update.success_status")
          redirect_to @commentable
        }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html { redirect_to @commentable }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable }
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def authenticate!
    session[:user_return_to] = request.path
    authenticate_user!
  end
end
