class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :registration_code, null: false
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
