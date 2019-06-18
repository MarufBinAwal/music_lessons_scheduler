class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :availability_id
      t.integer :student_id
      t.string :instrument
      t.text :misc_notes
      t.integer :price_of_lesson
      t.string :user
      t.boolean :active
  
      t.timestamps
    end
  end
end
