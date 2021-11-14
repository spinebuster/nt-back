module Products
  module Discounts
    # This is the Discounts update service
    class UpdateService < ApplicationService
      def execute!
        discount = @main_object.discounts.find(@params[:id])
        discount.update!(@params[:discount])
        apply_api_template(discount)
      end
    end
  end
end
