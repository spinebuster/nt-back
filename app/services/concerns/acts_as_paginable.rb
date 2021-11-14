# This module includes all the methods that a services needs to
# apply an ActsAsApi template
module ActsAsPaginable
  extend ::ActiveSupport::Concern

  include Pagy::Backend

  # This are the Class Methods that this concern extends
  module ClassMethods
  end

  def paginate(scope)
    pagy(scope)
  end

  def params
    @params
  end
end
