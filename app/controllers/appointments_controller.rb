class AppointmentsController < ApplicationController

	def schedule_appointment
		if !params[:doctor_id].blank? && !params[:patient_id].blank?
			if !params[:start_date].blank? && !params[:start_time].blank? && !params[:end_date].blank? && !params[:end_time].blank?
				@doctor_appointments = Appointment.where(doctor_id: params[:doctor_id])

				appointment_start_time = get_date_time(params[:start_date].to_date, params[:start_time])
				appointment_end_time = get_date_time(params[:end_date].to_date, params[:end_time])

				success = false
				@doctor_appointments.map { |appointment|     
					if !appointment_start_time.between?(appointment.start_time, appointment.end_time)
						Appointment.create!(doctor_id: params[:doctor_id], patient_id: params[:patient_id], start_time: appointment_start_time, end_time: appointment_end_time)
						success = true
					else
						success = false
					end
			}

				if success
			    render json: {
			      code: 200,
			      success: true,
			      message: "Appointment has been made successfully",
			      data: nil
			    }
			  else
			    render json: {
			      code: 400,
			      success: false,
			      message: "Doctor already have an appointment. Please select another time",
			      data: nil
			    }
			  end
			else
		    render json: {
		      code: 400,
		      success: false,
		      message: "Please select start_date, start_time, end_date and end_time to schedule doctor appointment",
		      data: nil
		    }
			end 
		else
	    render json: {
	      code: 400,
	      success: false,
	      message: "doctor_id and patient_id can't be blank",
	      data: nil
	    }
		end
	end


	private

  def get_date_time(date, time)
    d = date.strftime("%Y-%b-%d")
    t = time.to_time.strftime("%H:%M:%S")
    datetime = d + " " + t
  end

  # def check_doctor_availability(start_time, end_time)
  # 	if 
  # end

end