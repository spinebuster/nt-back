# This is the ProductsController class
class ProductsController < ApplicationController
  def index
    emitter_format Products::IndexService
  end

  def create
    emitter_format Products::CreateService
  end

  def show
    emitter_format Products::ShowService
  end

  def update
    emitter_format Products::UpdateService
  end

  def destroy
    emitter_format Products::DestroyService
  end

  def permit_params_create(params)
    params.permit(product: %i[code name])
  end

  def permit_params_update(params)
    params.permit([:id, { product: %i[code name] }])
  end
end
