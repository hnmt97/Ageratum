class CreatePackings < ActiveRecord::Migration[5.2]
  def change
    create_table :packings do |t|
	  t.string :nickname, null:false
      t.string :val1
      t.string :val2
      t.string :val3
      t.string :val4
      t.string :val5
      t.string :val6

      t.timestamps
    end

    add_index :packings, :nickname, unique: true
  end
end
