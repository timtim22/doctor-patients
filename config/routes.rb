Rails.application.routes.draw do
  post '/create-doctor' => "doctors#create"
  post '/available-time' => "doctors#available_time"

  post '/create-patient' => "patients#create"


  post '/schedule-appointment' => "appointments#schedule_appointment"


end
