module Products
  module Discounts
    # This is the Discounts index service
    class IndexService < ApplicationService
      include ActsAsIndexable

      def execute!
        indexable(@main_object.discounts)
      end
    end
  end
end
