class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bike_name
      t.text :details
      t.string :image
      t.integer :amount

      t.timestamps
    end
  end
end
