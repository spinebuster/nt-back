module Stores
  module Orders
    # This is the Orders create service
    class CreateService < ApplicationService
      def execute!
        apply_api_template(
          @main_object.orders.create_with_products(@params[:products_id], @params[:order][:date]),
        )
      end
    end
  end
end
