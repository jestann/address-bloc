class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.integer :age

      t.timestamps null: false
      t.belongs_to :script, index: true
    end
  end
end
