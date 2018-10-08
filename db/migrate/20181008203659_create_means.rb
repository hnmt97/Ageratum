class CreateMeans < ActiveRecord::Migration[5.2]
  def change
    create_table :means do |t|

      t.string :nickname, null:false
      t.string :val1
      t.string :val2
      t.string :val3

      t.timestamps
    end

    add_index :means, :nickname, unique: true
  end
end
