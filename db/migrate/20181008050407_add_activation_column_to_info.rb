class AddActivationColumnToInfo < ActiveRecord::Migration[5.2]
  def change
  	add_column :infos, :activation, :text, array: true
  end
end
