class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.date :book_date
      t.date :return_date
      t.string :city

      t.timestamps
    end
  end
end
