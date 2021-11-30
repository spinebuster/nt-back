module Stores
  module Orders
    # This is the Orders update service
    class UpdateService < ApplicationService
      def execute!
        order = @main_object.orders.find(@params[:id])
        order.update!(@params[:order])
        apply_api_template(order)
      end
    end
  end
end
