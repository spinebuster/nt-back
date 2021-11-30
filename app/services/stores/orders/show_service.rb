module Stores
  module Orders
    # This is the Orders show service
    class ShowService < ApplicationService
      def execute!
        apply_api_template(
          @main_object.orders.includes(order_products: :product).find(@params[:id]),
        )
      end
    end
  end
end
