class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :discounts,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.references :product,      null: false
      t.datetime   :date_start,   null: false
      t.datetime   :date_end,     null: false
      t.integer    :num_products, null: false
      t.integer    :pay_only,     default: 0
      t.float      :price,        default: 0.00

      t.timestamps null: false
    end
  end
end
