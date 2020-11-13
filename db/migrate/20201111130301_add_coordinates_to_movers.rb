class AddCoordinatesToMovers < ActiveRecord::Migration[6.0]
  def change
    add_column :movers, :latitude, :float
    add_column :movers, :longitude, :float
  end
end
