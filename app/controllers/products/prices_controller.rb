module Products
  # This is the PricesController class
  class PricesController < Products::ApplicationController
    def index
      emitter_format Products::Prices::IndexService
    end

    def create
      emitter_format Products::Prices::CreateService
    end

    def show
      emitter_format Products::Prices::ShowService
    end

    def update
      emitter_format Products::Prices::UpdateService
    end

    def destroy
      emitter_format Products::Prices::DestroyService
    end

    def permit_params_create(params)
      params.permit(price: %i[date price])
    end

    def permit_params_update(params)
      params.permit([:id, { price: %i[date price] }])
    end
  end
end
