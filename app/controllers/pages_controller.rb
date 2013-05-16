class PagesController < ApplicationController

  def index
    @questions = case params[:filter]
                   when "mine" then
                     Kaminari.paginate_array(current_user.questions.order("created_at DESC"))
                   when "for_me" then
                     Question.find_all_by_locale.public.joins(:topics).where(:conditions => {:taxonomies => {:id => current_user.topics}}).order("created_at DESC")
                   when "most_popular" then
                     Question.find_all_by_locale.public.most_popular.order("created_at DESC")
                   when "answered" then
                     Question.find_all_by_locale.public.answered.order("created_at DESC")
                   when "unanswered" then
                     Question.find_all_by_locale.public.unanswered.order("created_at DESC")
                   else Question.find_all_by_locale.public.order("created_at DESC")
                 end

    @questions = @questions.page(params[:page])

    @top_contributors = User.professionals.order("answers_count DESC").limit(10)
  end

  def show
    @page = Page.find_by_name(params[:id])
  end

end
