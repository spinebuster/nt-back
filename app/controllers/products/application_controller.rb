module Products
  class ApplicationController < ::ApplicationController
    protected

    def main_object
      Product.find(params[:product_id])
    end
  end
end
