module Stores
  # This is the Stores update service
  class UpdateService < ApplicationService
    def execute!
      store = Store.find(@params[:id])
      store.update!(@params[:store])
      apply_api_template(store)
    end
  end
end
