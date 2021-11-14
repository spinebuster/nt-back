module Products
  module Discounts
    # This is the Discounts show service
    class ShowService < ApplicationService
      def execute!
        apply_api_template(@main_object.discounts.find(@params[:id]))
      end
    end
  end
end
