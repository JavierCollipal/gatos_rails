class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.belongs_to :color, foreign_key: true
      t.belongs_to :breed, foreign_key: true
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
