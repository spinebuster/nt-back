# This module includes all the methods that a services needs to
# apply an ActsAsApi template
module ActsAsTemplate
  extend ::ActiveSupport::Concern

  # This are the Class Methods that this concern extends
  module ClassMethods
  end

  def apply_api_template(scope)
    scope.as_api_response(@params[:tpl] || :base)
  end
end
