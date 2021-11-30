class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :orders,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.references :store, null: false
      t.datetime   :date,  null: false
      t.integer    :code,  null: false
      # Se puede pensar en que el precio sea un atributo de la orden y se
      # calcule automaticamente con cada insercción de un producto
      # t.float    :price, default: 0

      t.timestamps null: false
    end

    add_index :orders, :date, name: 'index_orders_on_code'
  end
end
