class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :family_name
      t.string :first_name
      t.string :email
      t.string :student_number
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
