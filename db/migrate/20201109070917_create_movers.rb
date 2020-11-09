class CreateMovers < ActiveRecord::Migration[6.0]
  def change
    create_table :movers do |t|
      t.string :name
      t.string :type_of_car
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
