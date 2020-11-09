class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :description
      t.string :status, default: "Pending", null: false
      t.datetime :date_time
      t.string :start_point
      t.string :end_point
      t.references :mover, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
