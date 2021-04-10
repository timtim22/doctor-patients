class FixAppointment < ActiveRecord::Migration[5.2]
  def change
  	remove_column :appointments, :name
  	add_column :appointments, :completed, :boolean
  	add_column :doctors, :availability, :datetime #can be string
  end
end