# This module includes all the methods that a controller needs to
# control the render of diferente formats
module ActsAsEmitter
  extend ::ActiveSupport::Concern

  def emitter_format(service)
    @data = service.execute!(main_object, current_params)
    respond_to do |format|
      format.json do
        render_json
        return
      end
    end
  end

  protected

  def current_params
    if respond_to?("permit_params_#{params[:action]}")
      send("permit_params_#{params[:action]}", params)
    else
      params
    end
  end

  def render_json
    render json: {
      success: true,
      data: @data,
    }
  end
end
