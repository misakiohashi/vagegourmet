class AddExplanationToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :explanation, :string
  end
end
