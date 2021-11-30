class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table(
      :stores,
      options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8'
    ) do |t|
      t.string :name,    null: false
      t.text   :address, null: false
      t.string :email,   null: false
      t.string :phone,   null: false

      t.timestamps null: false
    end

    add_index :stores, :name, name: 'index_stores_on_name'
    add_index(
      :stores, :email,
      name: 'index_stores_on_email',
      unique: true
    )
  end
end

