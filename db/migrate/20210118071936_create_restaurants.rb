class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :holiday
      t.string :photo
      t.references :category, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
