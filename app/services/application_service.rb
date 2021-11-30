class ApplicationService
  include ActsAsPaginable
  include ActsAsTemplate

  class << self
    def execute!(*args)
      new(*args).execute!
    end
  end

  def initialize(main_object, params = {})
    @main_object = main_object
    @params = params
  end
end
