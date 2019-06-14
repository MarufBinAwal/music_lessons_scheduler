class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :student
      t.string :instructor
      t.string :day
      t.time :start_time
      t.time :end_time
      t.string :instrument
      t.text :misc_notes
      t.integer :price_of_lesson
  
      t.timestamps
    end
  end
end
