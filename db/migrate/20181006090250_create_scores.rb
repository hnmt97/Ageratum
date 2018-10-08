class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :nickname
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
