# This is the StoresController class
class StoresController < ApplicationController
  def index
    emitter_format Stores::IndexService
  end

  def create
    emitter_format Stores::CreateService
  end

  def show
    emitter_format Stores::ShowService
  end

  def update
    emitter_format Stores::UpdateService
  end

  def destroy
    emitter_format Stores::DestroyService
  end

  def permit_params_create(params)
    params.permit(
      store: %i[
        name address email phone
      ],
    )
  end

  def permit_params_update(params)
    params.permit(
      [
        :id, {
          store: %i[
            name address email phone
          ],
        }
      ],
    )
  end
end
