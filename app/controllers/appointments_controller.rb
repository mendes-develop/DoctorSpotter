class AppointmentsController < ApplicationController

  def index
    @appointments = @current_patient.appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  def edit
    @appointment = Appointment.find(params[:id])

  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(set_params)
    if @appointment.valid?
      redirect_to appointments_path()
    else
      redirect_back fallback_location: search_path()
    end

  end

  def new
    @appointment = Appointment.new(doctor_id: params["doctor_id"], patient_id: @current_patient.id)
  end

  def create

    @appointment = Appointment.create(set_params)
    if @appointment.valid?
      redirect_to patient_path(@current_patient)
    else
      redirect_back fallback_location: search_path()
    end



  end

  private

  def set_params
    params.require(:appointment).permit(:date, :condition, :doctor_id, :patient_id)
  end


end
