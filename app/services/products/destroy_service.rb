module Products
  # This is the Products destroy service
  class DestroyService < ApplicationService
    def execute!
      product = Product.find(@params[:id])
      product.destroy
      apply_api_template(product)
    end
  end
end
