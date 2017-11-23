class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.boolean :is_lost, default: true
      t.integer :lost_id

      t.timestamps
    end
  end
end
