class BusinessesController < ApplicationController

  def index
    @businesses = [
      'optimumweb',
      'pierre-roy-et-associes'
    ]
  end

end
