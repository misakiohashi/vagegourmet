class AddAreaToCities < ActiveRecord::Migration[5.2]
  def change
    add_reference :cities, :area, foreign_key: true
  end
end
