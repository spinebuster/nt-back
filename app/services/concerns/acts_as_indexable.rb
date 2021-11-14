# This module includes the standar methos to use for the index service
# which includes the follwing behavior:
# - Paginable
# - Searchable
# - Templatable
module ActsAsIndexable
  extend ::ActiveSupport::Concern

  # This are the Class Methods that this concern extends
  module ClassMethods
  end

  def indexable(scope)
    # Ver si hay que incluir tabla
    scope = include_table(scope)

    # Ver si hay que filtrar
    scope = ransack(scope)

    # Ver si hay que ordenar
    scope = sort(scope)
    pagy, records = paginate(scope)
    {
      total_count: pagy.count,
      pagy: pagy,
      records: apply_api_template(records),
    }
  end

  protected

  def include_table(scope)
    return scope unless @params[:includes]

    scope.includes(@params[:includes])
  end

  def use_distinct?
    return false unless @params[:q]

    @params[:q][:distinct].to_s.to_boolean
  end

  def ransack(scope)
    scope.ransack(
      @params[:q],
    ).result(
      distinct: use_distinct?,
    )
  end

  def sort(scope)
    return scope unless @params[:order]

    scope.order(@params[:order])
  end
end
