module Products
  # This is the Products update service
  class UpdateService < ApplicationService
    def execute!
      product = Product.find(@params[:id])
      product.update!(@params[:product])
      apply_api_template(product)
    end
  end
end
