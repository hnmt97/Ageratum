class CreateActivations < ActiveRecord::Migration[5.2]
  def change
    create_table :activations do |t|
	  t.string :nickname, null:false
      t.string :val1
      t.string :val2
      t.string :val3
      t.string :val4
      t.string :val5

      t.timestamps
    end

    add_index :activations, :nickname, unique: true
  end
end
