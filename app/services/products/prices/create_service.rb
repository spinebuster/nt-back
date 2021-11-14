module Products
  module Prices
    # This is the Prices create service
    class CreateService < ApplicationService
      def execute!
        apply_api_template(
          @main_object.prices.create!(@params[:price]),
        )
      end
    end
  end
end
