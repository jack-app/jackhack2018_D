class CreateCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :circles do |t|
      t.string :name
      t.text :profile
      t.boolean :intercollege
      t.integer :cost

      t.timestamps
    end
  end
end
