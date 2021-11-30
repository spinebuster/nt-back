module Stores
  # This is the Stores create service
  class CreateService < ApplicationService
    def execute!
      apply_api_template(
        Store.create!(@params[:store]),
      )
    end
  end
end
