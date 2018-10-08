class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :sender, null: false
      t.string :receiver, null: false
      t.string :trading
      t.string :method
      t.string :contact
      t.string :shipment
      t.string :packing
      t.string :money
      t.text :other

      t.timestamps
    end

    add_index :posts, :sender
    add_index :posts, :receiver
  end
end
