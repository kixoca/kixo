class PagesController < ApplicationController

  def index
    @questions = case params[:filter]
                   when "mine" then
                     Kaminari.paginate_array(current_user.questions)
                   when "for_me" then
                     Question.find_all_by_locale.public.joins(:topics).where(:conditions => {:taxonomies => {:id => current_user.topics}})
                   when "most_popular" then
                     Question.find_all_by_locale.public.most_popular
                   when "answered" then
                     Question.find_all_by_locale.public.answered
                   when "unanswered" then
                     Question.find_all_by_locale.public.unanswered
                   else Question.find_all_by_locale.public
                 end

    @questions = @questions.page(params[:page])

    @top_contributors = User.professionals.order("answers_count DESC").limit(10)

    @current_action_tab = "ask"
  end

end
