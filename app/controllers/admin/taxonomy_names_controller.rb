class Admin::TaxonomyNamesController < ApplicationController
  def destroy
    @taxonomy_name = TaxonomyName.find(params[:id])
    @taxonomy_name.destroy
  end
end