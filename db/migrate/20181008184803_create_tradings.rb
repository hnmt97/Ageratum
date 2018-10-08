class CreateTradings < ActiveRecord::Migration[5.2]
  def change
    create_table :tradings do |t|
      t.string :nickname, null:false
      t.string :val1
      t.string :val2
      t.string :val3
      t.string :val4

      t.timestamps
    end

    add_index :tradings, :nickname, unique: true
  end
end
