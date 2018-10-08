class ChangeDataTypeToArray < ActiveRecord::Migration[5.2]
  def change
  	change_column :infos, :trading, :array
  	change_column :infos, :method, :array
  	change_column :infos, :contact, :array
  	change_column :infos, :shipment, :array
  	change_column :infos, :packing, :array
  	change_column :infos, :money, :array
  end
end
