class UpdateColumnForInfos < ActiveRecord::Migration[5.2]
  def change
  	change_column :infos, :trading, :text, array: true, using: 'trading::text[]'
  	change_column :infos, :method, :text, array: true, using: '(method::text[])'
  	change_column :infos, :contact, :text, array: true, using: '(contact::text[])'
  	change_column :infos, :shipment, :text, array: true, using: 'shipment::text[]'
  	change_column :infos, :packing, :text, array: true, using: 'packing::text[]'
  	change_column :infos, :money, :text, array: true, using: 'money::text[]'
  	change_column :infos, :activation, :text, array: true, using: 'activation::text[]'
  end
end
