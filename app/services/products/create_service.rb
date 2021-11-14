module Products
  # This is the Products create service
  class CreateService < ApplicationService
    def execute!
      apply_api_template(
        Product.create!(@params[:product]),
      )
    end
  end
end
