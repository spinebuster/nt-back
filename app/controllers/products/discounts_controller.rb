module Products
  # This is the DiscountsController class
  class DiscountsController < Products::ApplicationController
    def index
      emitter_format Products::Discounts::IndexService
    end

    def create
      emitter_format Products::Discounts::CreateService
    end

    def show
      emitter_format Products::Discounts::ShowService
    end

    def update
      emitter_format Products::Discounts::UpdateService
    end

    def destroy
      emitter_format Products::Discounts::DestroyService
    end

    def permit_params_create(params)
      params.permit(
        discount: %i[
          date_start date_end num_products pay_only price
        ],
      )
    end

    def permit_params_update(params)
      params.permit(
        [
          :id,
          { discount: %i[
            date_start date_end num_products pay_only price
          ] },
        ],
      )
    end
  end
end
