class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :prices,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.references :product, null: false
      t.datetime   :date,    null: false
      t.float      :price,   null: false

      t.timestamps null: false
    end

    add_index :prices, :date, name: 'index_prices_on_date'
  end
end
