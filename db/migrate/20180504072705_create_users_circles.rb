class CreateUsersCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :users_circles do |t|
      t.integer :user_id
      t.integer :circle_id
      t.integer :permission, default: 0

      t.timestamps
    end
  end
end
