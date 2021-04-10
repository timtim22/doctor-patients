class DoctorsController < ApplicationController

  def create
  	if !params[:name].blank?
  		@doctor = Doctor.new
  		@doctor.name = params[:name]
  		@doctor.available_start_time = ""
  		@doctor.available_end_time = ""

  		if @doctor.save
		    render json: {
		      code: 200,
		      success: true,
		      message: "Doctor profile successfully created",
		      data: {
		      	id: @doctor.id,
		      	name: @doctor.name
		      }
		    }
  		else
		    render json: {
		      code: 400,
		      success: false,
		      message: @doctor.errors.full_messages,
		      data: nil
		    }
  		end
  	else
	    render json: {
	      code: 400,
	      success: false,
	      message: "Name can't be blank",
	      data: nil
	    }
  	end
  end

  #daily available time i.e. 9AM to 5PM. Can only add daily available timing
  # def available_time
  # 	if !params[:doctor_id].blank?
  # 		if Doctor.where(id: params[:doctor_id]).exists?
		#   	if !params[:start_date].blank? && !params[:start_time].blank? && !params[:end_date].blank? && !params[:end_time].blank?
		#   		@doctor = Doctor.find(params[:doctor_id])
		#   		@doctor.available_start_time = get_date_time(params[:start_date].to_date, params[:start_time])
		#   		@doctor.available_end_time = get_date_time(params[:end_date].to_date, params[:end_time])
		#   		if @doctor.save
		# 		    render json: {
		# 		      code: 200,
		# 		      success: true,
		# 		      message: "available time added successfully",
		# 		      data: {
		# 		      	id: @doctor.id,
		# 		      	name: @doctor.name,
		# 		      	available_start_time: @doctor.available_start_time,
		# 		      	available_end_time: @doctor.available_end_time
		# 		      }
		# 		    }
		# 		else
		# 		    render json: {
		# 		      code: 400,
		# 		      success: false,
		# 		      message: @doctor.errors.full_messages,
		# 		      data: nil
		# 		    }
		# 		end
		#   	else
		# 	    render json: {
		# 	      code: 400,
		# 	      success: false,
		# 	      message: "start_date, start_time, end_date and end_time can't be blank",
		# 	      data: nil
		# 	    }
		#   	end
		# else
		#     render json: {
		#       code: 400,
		#       success: false,
		#       message: "Doctor profile doesnt exists with the following id",
		#       data: nil
		#     }
		# end
	 # else
	 #    render json: {
	 #      code: 400,
	 #      success: false,
	 #      message: "doctor_id is required",
	 #      data: nil
	 #    }
	 # end
  # end

  private

  def get_date_time(date, time)
    d = date.strftime("%Y-%b-%d")
    t = time.to_time.strftime("%H:%M:%S")
    datetime = d + " " + t
  end

end