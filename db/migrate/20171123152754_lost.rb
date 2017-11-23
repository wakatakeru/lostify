class Lost < ActiveRecord::Migration[5.1]
  def change
    add_column :losts, :property_id, :integer
  end
end
