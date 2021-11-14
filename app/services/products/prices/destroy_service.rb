module Products
  module Prices
    # This is the Prices destroy service
    class DestroyService < ApplicationService
      def execute!
        price = @main_object.prices.find(@params[:id])
        price.destroy
        apply_api_template(price)
      end
    end
  end
end
