class AddCountryToClothings < ActiveRecord::Migration[7.1]
  def change
    add_column :clothings, :country, :string
  end
end
