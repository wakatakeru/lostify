class CreateLosts < ActiveRecord::Migration[5.1]
  def change
    create_table :losts do |t|
      t.string :current_location, null: false
      t.string :pickup_location

      t.timestamps
    end
  end
end
