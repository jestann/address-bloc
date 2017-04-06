class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.integer :number
      t.belongs_to :script, index: true

      t.timestamps null: false
    end
  end
end
