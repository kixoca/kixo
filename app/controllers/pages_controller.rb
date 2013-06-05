class PagesController < ApplicationController

  def index
    filter = params[:filter] || "all"

    @questions = case filter
                   when "mine" then
                     if user_signed_in?
                       Kaminari.paginate_array(current_user.questions.order("created_at DESC"))
                     end
                   when "for_me" then
                     if user_signed_in? && current_user.is_professional?
                       Question.find_all_by_locale.joins(:topics).where(:conditions => {:taxonomies => {:id => current_user.topics}}).order("created_at DESC")
                     end
                   when "most_popular" then
                     if user_signed_in? && current_user.is_professional?
                       Question.find_all_by_locale.most_popular.order("created_at DESC")
                     else
                       Question.find_all_by_locale.public.most_popular.order("created_at DESC")
                     end
                   when "answered" then
                     if user_signed_in? && current_user.is_professional?
                       Question.find_all_by_locale.answered.order("created_at DESC")
                     else
                       Question.find_all_by_locale.public.answered.order("created_at DESC")
                     end
                   when "unanswered" then
                     if user_signed_in? && current_user.is_professional?
                       Question.find_all_by_locale.unanswered.order("created_at DESC")
                     else
                       Question.find_all_by_locale.public.unanswered.order("created_at DESC")
                     end
                   when "all" then
                     if user_signed_in? && current_user.is_professional?
                       Question.find_all_by_locale.order("created_at DESC")
                     else
                       Question.find_all_by_locale.public.order("created_at DESC")
                     end
                 end

    @questions = @questions.page(params[:page])

    @top_contributors = User.professionals.order("answers_count DESC").limit(10)
  end

  def show
    @page = Page.find_by_name(params[:id])

    @page_title = t("pages.show.page_title", :title => @page.meta_title || @page.title)
  end

end
