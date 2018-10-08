class RollbackToPreviousDataType < ActiveRecord::Migration[5.2]
  def change
  	change_column :infos, :trading, :text, array: true
  	change_column :infos, :method, :text, array: true
  	change_column :infos, :contact, :text, array: true
  	change_column :infos, :shipment, :text, array: true
  	change_column :infos, :packing, :text, array: true
  	change_column :infos, :money, :text, array: true
  end
end
