class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.belongs_to :act, index: true
      t.integer :number
      t.text :text

      t.timestamps null: false
    end
  end
end
