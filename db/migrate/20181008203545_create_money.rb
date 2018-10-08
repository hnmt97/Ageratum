class CreateMoney < ActiveRecord::Migration[5.2]
  def change
    create_table :money do |t|
      t.string :nickname, null:false
      t.string :val1
      t.string :val2
      t.string :val3
      t.string :val4
      t.string :val5
      t.string :val6
      t.string :val7
      t.string :val8

      t.timestamps
    end

    add_index :money, :nickname, unique: true
  end
end
