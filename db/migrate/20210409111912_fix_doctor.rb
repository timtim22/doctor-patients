class FixDoctor < ActiveRecord::Migration[5.2]
  def change
	remove_column :doctors, :availability
 	add_column :doctors, :availabe_start_time, :datetime 
 	add_column :doctors, :availabe_end_time, :datetime
 	add_column :doctors, :available, :boolean
  end
end
