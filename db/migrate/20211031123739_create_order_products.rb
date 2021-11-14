class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :order_products,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.references :order,   null: false
      t.references :product, null: false
      t.datetime   :date,    null: false
      t.integer    :code,    null: false
      t.float      :price,   null: false

      t.timestamps null: false
    end
  end
end
