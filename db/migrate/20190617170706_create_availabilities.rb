class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.time :start_time
      t.time :end_time
      t.string :day
      t.integer :instructor_id

      t.timestamps
    end
  end
end
