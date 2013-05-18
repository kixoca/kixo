class MessagesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :verify_if_participant!

  def show
    @message = Message.find(params[:id])

    @message.read = true
    @message.save

    track_event "View Message"

    respond_to do |format|
      format.html
      format.json { render :json => @message }
      format.xml  { render :xml => @message }
    end
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])

    @message = @conversation.messages.new(params[:message])
    @message.author = current_user

    respond_to do |format|
      if @message.save
        track_event "Create Comment"
        format.html { redirect_to @conversation }
        format.json { render :json => @message, :status => :created, :location => @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        track_event "Create Comment (Error)"
        format.html do
          flash[:alert] = "Could not create the message."
          redirect_to @conversation
        end
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def authenticate!
    message = Message.find(params[:id])
    if message && message.author != current_user
      flash[:error] = t("security.access_denied")
      redirect_to message.conversation
    end
    session[:user_return_to] = url_for(:controller => params[:controller], :action => params[:action])
    authenticate_user!
  end

  def verify_if_participant!
    conversation = Conversation.find(params[:conversation_id])
    unless conversation.participants.include?(current_user)
      flash[:alert] = "You are not authorized to view this conversation."
      redirect_to root_path
    end
  end

end