module Orders
  # This is the Orders update service
  class UpdateService < ApplicationService
    def execute!
      order = Order.find(@params[:id])
      order.update!(@params[:order])
      apply_api_template(order)
    end
  end
end
