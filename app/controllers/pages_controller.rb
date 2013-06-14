class PagesController < ApplicationController
  def show
    @page = Page.find_by_name(params[:id])

    @page_title = t("pages.show.page_title", :title => @page.meta_title || @page.title)
  end
end
