class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :nickname, null: false
      t.text :genre
      t.string :trading
      t.string :method
      t.string :contact
      t.string :shipment
      t.string :packing
      t.string :money
      t.string :history
      t.text :other

      t.timestamps
    end

    add_index :infos, :nickname, unique: true
  end
end
