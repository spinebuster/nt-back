module Products
  # This is the Products index service
  class IndexService < ApplicationService
    include ActsAsIndexable

    def execute!
      indexable(Product)
    end
  end
end
