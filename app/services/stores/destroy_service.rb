module Stores
  # This is the Stores destroy service
  class DestroyService < ApplicationService
    def execute!
      store = Store.find(@params[:id])
      store.destroy
      apply_api_template(store)
    end
  end
end
