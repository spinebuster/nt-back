module Stores
  module Orders
    # This is the Orders destroy service
    class DestroyService < ApplicationService
      def execute!
        order = @main_object.orders.find(@params[:id])
        order.destroy
        apply_api_template(order)
      end
    end
  end
end
