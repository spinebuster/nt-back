module Stores
  # This is the Stores show service
  class ShowService < ApplicationService
    def execute!
      apply_api_template(Store.find(@params[:id]))
    end
  end
end
