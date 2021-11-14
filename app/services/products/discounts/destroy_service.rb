module Products
  module Discounts
    # This is the Discounts destroy service
    class DestroyService < ApplicationService
      def execute!
        discount = @main_object.discounts.find(@params[:id])
        discount.destroy
        apply_api_template(discount)
      end
    end
  end
end
