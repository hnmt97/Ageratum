class RemoveArrayColumnFromInfos < ActiveRecord::Migration[5.2]
  def change
  	remove_column :infos, :trading, :text
  	remove_column :infos, :activation, :text
  	remove_column :infos, :method, :text
  	remove_column :infos, :shipment, :text
  	remove_column :infos, :packing, :text
  	remove_column :infos, :money, :text
  	remove_column :infos, :contact, :text
  end
end
