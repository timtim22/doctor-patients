class PatientsController < ApplicationController
  def create
  	if !params[:name].blank?
  		@patient = Patient.new
  		@patient.name = params[:name]
  		if @patient.save
		    render json: {
		      code: 200,
		      success: true,
		      message: "Patient profile successfully created",
		      data: {
		      	id: @patient.id,
		      	name: @patient.name
		      }
		    }
  		else
		    render json: {
		      code: 400,
		      success: false,
		      message: @patient.errors.full_messages,
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
end