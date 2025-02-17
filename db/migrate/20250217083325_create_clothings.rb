class CreateClothings < ActiveRecord::Migration[7.1]
  def change
    create_table :clothings do |t|
      t.string :name
      t.float :price
      t.string :color
      t.string :size
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
