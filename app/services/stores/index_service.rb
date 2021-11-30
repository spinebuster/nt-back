module Stores
  # This is the Stores index service
  class IndexService < ApplicationService
    include ActsAsIndexable

    def execute!
      indexable(Store)
    end
  end
end
