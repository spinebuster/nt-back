class ApplicationService
  include ActsAsPaginable
  include ActsAsTemplate

  def initialize(main_object, params = {})
    @main_object = main_object
    @params = params
  end
end
