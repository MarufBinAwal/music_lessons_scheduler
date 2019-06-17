class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :instructor_id
      t.string :day
      t.string :start_time
      t.string :end_time
      t.string :instrument
      t.text :misc_notes
      t.integer :price_of_lesson
      t.string :user
      t.boolean :active
  
      t.timestamps
    end
  end
end
