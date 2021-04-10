class FixSyntax < ActiveRecord::Migration[5.2]
  def change
 	remove_column :doctors, :availabe_start_time, :datetime 
 	remove_column :doctors, :availabe_end_time, :datetime
 	add_column :doctors, :available_start_time, :datetime
 	add_column :doctors, :available_end_time, :datetime
  end
end
