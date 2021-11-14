class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActsAsExceptionable
  include ActsAsEmitter

  def main_object; end
end
