class Doctor < ApplicationRecord
	has_many :appointments 
	has_many :patients, through: :appointments

	validates :name, presence: true, on: :create
	validate :check_days

	# def check_days #start and end time cant be greater than a day if creating available time
	# 	if available_end_time.to_date - available_start_time.to_date != 0
	# 		errors.add(:available_end_time, "should be for the same day")
	# 	elsif available_end_time.to_date - available_start_time.to_date < 0
	# 		errors.add(:available_end_time, "cant be behind available_end_time")
	# 	end
	# end
end
