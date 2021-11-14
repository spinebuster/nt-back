class OrdersController < ApplicationController
  def index
    emitter_format Orders::IndexService
  end

  def create
    emitter_format Orders::CreateService
  end

  def show
    emitter_format Orders::ShowService
  end

  def update
    emitter_format Orders::UpdateService
  end

  def destroy
    emitter_format Orders::DestroyService
  end

  def permit_params_create(params)
    params.permit([:products_id, { order: %i[date] }])
  end

  def permit_params_update(params)
    params.permit([:id, { order: %i[date] }])
  end
end
