class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :phone_number
      t.string :email
      t.string :instruments
      t.string :pay_rate
      t.text :password_digest
      t.text :biography
      t.text :misc_notes
      t.boolean :active
      
      t.timestamps
    end
  end
end
