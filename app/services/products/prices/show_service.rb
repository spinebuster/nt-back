module Products
  module Prices
    # This is the Prices show service
    class ShowService < ApplicationService
      def execute!
        apply_api_template(@main_object.prices.find(@params[:id]))
      end
    end
  end
end
