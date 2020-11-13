class AddAddressToMover < ActiveRecord::Migration[6.0]
  def change
    add_column :movers, :address, :string
  end
end
