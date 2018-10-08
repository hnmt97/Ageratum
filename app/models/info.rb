class Info < ApplicationRecord
	serialize :activation, Array
	serialize :trading, Array
	serialize :packing, Array
	serialize :money, Array
	serialize :contact, Array
	serialize :method, Array
	serialize :shipment, Array
end
