class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :phone_number
      t.string :email
      t.text :misc_notes
      t.text :billing_notes
      
      t.timestamps
    end
  end
end
