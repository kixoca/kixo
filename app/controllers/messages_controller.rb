class MessagesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_participant!, :only => [:read]

  def create
    @conversation = Conversation.find(params[:conversation_id])

    @message = @conversation.messages.new(params[:message])
    @message.author = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @conversation }
        format.json { render :json => @message, :status => :created, :location => @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html {
          flash[:alert] = "Could not create the message."
          redirect_to @conversation
        }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def read
    @message = Message.find(params[:id])
    @conversation = Conversation.find(params[:conversation_id])

    @message.read = true

    respond_to do |format|
      if @message.save
        format.html { redirect_to @conversation }
        format.json { render :json => @message, :status => :created, :location => @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html {
          flash[:alert] = "Could not read the message."
          redirect_to @conversation
        }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def check_if_participant!
    conversation = Conversation.find(params[:conversation_id])
    unless conversation.participants.include?(current_user)
      flash[:alert] = "You are not authorized to view this conversation."
      redirect_to root_path
    end
  end

end