# This module includes all the methods that a check Exceptions for controllers
module ActsAsExceptionable
  extend ::ActiveSupport::Concern

  included do
    rescue_from Exception, with: :json_exception # if Rails.env.production?
    rescue_from(
      ActiveRecord::RecordInvalid,
      with: :activercord_recordinvalid,
    )
    rescue_from(
      ActiveRecord::RecordNotFound,
      with: :activercord_recordnotfound,
    )
    rescue_from(
      ActionController::RoutingError,
      with: :actioncontroller_routingerror,
    )
  end

  def trace_exception(exception)
    Rails.logger.info "EXCEPTION: #{exception.message}"
    return unless exception.backtrace

    exception.backtrace.each do |line|
      Rails.logger.info line
    end
  end

  def json_exception(exception)
    trace_exception(exception)
    respond_to do |format|
      format.json do
        render json: {
          success: false,
          message: exception.message,
        }
      end
      format.html { render500 }
    end
  end

  def activercord_recordinvalid(exception)
    # trace_exception(exception)
    respond_to do |format|
      format.json do
        render json: {
          success: false,
          errors: exception.record.errors,
        }
      end
    end
  end

  def activercord_recordnotfound(exception)
    trace_exception(exception)
    respond_to do |format|
      format.json do
        render json: {
          success: false,
          message: exception.message,
        }
      end
    end
  end

  def actioncontroller_routingerror
    respond_to do |format|
      format.html { render404 }
    end
  end

  def render404
    render file: "public/404.html", status: :not_found
  end

  def render500
    render file: "public/500.html", status: :internal_server_error
  end
end
