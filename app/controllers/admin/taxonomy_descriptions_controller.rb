class Admin::TaxonomyDescriptionsController < ApplicationController
  def destroy
    @taxonomy_description = TaxonomyDescription.find(params[:id])
    @taxonomy_description.destroy
  end
end