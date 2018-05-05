class CreateCirclesTags < ActiveRecord::Migration[5.1]
  def change
    create_table :circles_tags do |t|
      t.integer :circle_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
