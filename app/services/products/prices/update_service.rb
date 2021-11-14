module Products
  module Prices
    # This is the Prices update service
    class UpdateService < ApplicationService
      def execute!
        price = @main_object.prices.find(@params[:id])
        price.update!(@params[:price])
        apply_api_template(price)
      end
    end
  end
end
