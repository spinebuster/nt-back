module Products
  # This is the Products show service
  class ShowService < ApplicationService
    def execute!
      apply_api_template(Product.find(@params[:id]))
    end
  end
end
