module Stores
  # This is the OrdersController class
  class OrdersController < Stores::ApplicationController
    def index
      emitter_format Stores::Orders::IndexService
    end

    def create
      emitter_format Stores::Orders::CreateService
    end

    def show
      emitter_format Stores::Orders::ShowService
    end

    def update
      emitter_format Stores::Orders::UpdateService
    end

    def destroy
      emitter_format Stores::Orders::DestroyService
    end

    def permit_params_create(params)
      params.permit([:products_id, { order: %i[date] }])
    end

    def permit_params_update(params)
      params.permit([:id, { order: %i[date] }])
    end
  end
end
