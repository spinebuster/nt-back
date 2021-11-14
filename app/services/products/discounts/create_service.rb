module Products
  module Discounts
    # This is the Discounts create service
    class CreateService < ApplicationService
      def execute!
        apply_api_template(
          @main_object.discounts.create!(@params[:discount]),
        )
      end
    end
  end
end
