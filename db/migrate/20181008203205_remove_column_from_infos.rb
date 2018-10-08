class RemoveColumnFromInfos < ActiveRecord::Migration[5.2]
  def change
  	remove_column :infos, :trading, :string
  	remove_column :infos, :method, :string
  	remove_column :infos, :money, :string
  	remove_column :infos, :shipment, :string
  	remove_column :infos, :packing, :string
  	remove_column :infos, :contact, :string
  end
end
