class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :token, null: false, unique: true
      t.boolean :is_lost, default: false
      t.integer :lost_id

      t.timestamps
    end
  end
end
