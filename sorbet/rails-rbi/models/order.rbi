# This is an autogenerated file for dynamic methods in Order
# Please rerun bundle exec rake rails_rbi:models[Order] to regenerate.

# typed: strong
module Order::ActiveRelation_WhereNot
  sig { params(opts: T.untyped, rest: T.untyped).returns(T.self_type) }
  def not(opts, *rest); end
end

module Order::GeneratedAttributeMethods
  sig { returns(Integer) }
  def code; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def code=(value); end

  sig { returns(T::Boolean) }
  def code?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def created_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def created_at=(value); end

  sig { returns(T::Boolean) }
  def created_at?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def date; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def date=(value); end

  sig { returns(T::Boolean) }
  def date?; end

  sig { returns(Integer) }
  def id; end

  sig { params(value: T.any(Numeric, ActiveSupport::Duration)).void }
  def id=(value); end

  sig { returns(T::Boolean) }
  def id?; end

  sig { returns(ActiveSupport::TimeWithZone) }
  def updated_at; end

  sig { params(value: T.any(Date, Time, ActiveSupport::TimeWithZone)).void }
  def updated_at=(value); end

  sig { returns(T::Boolean) }
  def updated_at?; end
end

module Order::GeneratedAssociationMethods
  sig { returns(::OrderProduct::ActiveRecord_Associations_CollectionProxy) }
  def order_products; end

  sig { returns(T::Array[Integer]) }
  def order_product_ids; end

  sig { params(value: T::Enumerable[::OrderProduct]).void }
  def order_products=(value); end

  sig { returns(::Product::ActiveRecord_Associations_CollectionProxy) }
  def products; end

  sig { returns(T::Array[Integer]) }
  def product_ids; end

  sig { params(value: T::Enumerable[::Product]).void }
  def products=(value); end

  sig { returns(::PaperTrail::Version::ActiveRecord_Associations_CollectionProxy) }
  def versions; end

  sig { returns(T::Array[Integer]) }
  def version_ids; end

  sig { params(value: T::Enumerable[::PaperTrail::Version]).void }
  def versions=(value); end
end

module Order::CustomFinderMethods
  sig { params(limit: Integer).returns(T::Array[Order]) }
  def first_n(limit); end

  sig { params(limit: Integer).returns(T::Array[Order]) }
  def last_n(limit); end

  sig { params(args: T::Array[T.any(Integer, String)]).returns(T::Array[Order]) }
  def find_n(*args); end

  sig { params(id: T.nilable(Integer)).returns(T.nilable(Order)) }
  def find_by_id(id); end

  sig { params(id: Integer).returns(Order) }
  def find_by_id!(id); end
end

class Order < ApplicationRecord
  include Order::GeneratedAttributeMethods
  include Order::GeneratedAssociationMethods
  extend Order::CustomFinderMethods
  extend Order::QueryMethodsReturningRelation
  RelationType = T.type_alias { T.any(Order::ActiveRecord_Relation, Order::ActiveRecord_Associations_CollectionProxy, Order::ActiveRecord_AssociationRelation) }
end

module Order::QueryMethodsReturningRelation
  sig { returns(Order::ActiveRecord_Relation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Order::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_Relation) }
  def only(*args); end

  sig { params(block: T.proc.params(e: Order).returns(T::Boolean)).returns(T::Array[Order]) }
  def select(&block); end

  sig { params(args: T.any(String, Symbol, T::Array[T.any(String, Symbol)])).returns(Order::ActiveRecord_Relation) }
  def select_columns(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Order::ActiveRecord_Relation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Order::ActiveRecord_Relation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

module Order::QueryMethodsReturningAssociationRelation
  sig { returns(Order::ActiveRecord_AssociationRelation) }
  def all; end

  sig { params(block: T.nilable(T.proc.void)).returns(Order::ActiveRecord_Relation) }
  def unscoped(&block); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def reselect(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def order(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def reorder(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def group(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def limit(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def offset(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def left_joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def left_outer_joins(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def where(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def rewhere(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def preload(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def extract_associated(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def eager_load(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def includes(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def from(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def lock(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def readonly(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def or(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def having(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def create_with(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def distinct(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def references(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def none(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def unscope(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def optimizer_hints(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def merge(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def except(*args); end

  sig { params(args: T.untyped).returns(Order::ActiveRecord_AssociationRelation) }
  def only(*args); end

  sig { params(block: T.proc.params(e: Order).returns(T::Boolean)).returns(T::Array[Order]) }
  def select(&block); end

  sig { params(args: T.any(String, Symbol, T::Array[T.any(String, Symbol)])).returns(Order::ActiveRecord_AssociationRelation) }
  def select_columns(*args); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Order::ActiveRecord_AssociationRelation) }
  def extending(*args, &block); end

  sig do
    params(
      of: T.nilable(Integer),
      start: T.nilable(Integer),
      finish: T.nilable(Integer),
      load: T.nilable(T::Boolean),
      error_on_ignore: T.nilable(T::Boolean),
      block: T.nilable(T.proc.params(e: Order::ActiveRecord_AssociationRelation).void)
    ).returns(ActiveRecord::Batches::BatchEnumerator)
  end
  def in_batches(of: 1000, start: nil, finish: nil, load: false, error_on_ignore: nil, &block); end
end

class Order::ActiveRecord_Relation < ActiveRecord::Relation
  include Order::ActiveRelation_WhereNot
  include Order::CustomFinderMethods
  include Order::QueryMethodsReturningRelation
  Elem = type_member(fixed: Order)
end

class Order::ActiveRecord_AssociationRelation < ActiveRecord::AssociationRelation
  include Order::ActiveRelation_WhereNot
  include Order::CustomFinderMethods
  include Order::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Order)
end

class Order::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
  include Order::CustomFinderMethods
  include Order::QueryMethodsReturningAssociationRelation
  Elem = type_member(fixed: Order)

  sig { params(records: T.any(Order, T::Array[Order])).returns(T.self_type) }
  def <<(*records); end

  sig { params(records: T.any(Order, T::Array[Order])).returns(T.self_type) }
  def append(*records); end

  sig { params(records: T.any(Order, T::Array[Order])).returns(T.self_type) }
  def push(*records); end

  sig { params(records: T.any(Order, T::Array[Order])).returns(T.self_type) }
  def concat(*records); end
end
