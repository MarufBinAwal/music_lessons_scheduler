class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.string :start_time
      t.string :end_time
      t.string :day
      t.integer :instructor_id

      t.timestamps
    end
  end
end
