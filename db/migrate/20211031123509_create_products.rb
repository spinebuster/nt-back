class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :products,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :products, :code, name: 'index_products_on_code', unique: true
  end
end
