module Products
  module Prices
    # This is the Prices index service
    class IndexService < ApplicationService
      include ActsAsIndexable

      def execute!
        indexable(@main_object.prices)
      end
    end
  end
end
