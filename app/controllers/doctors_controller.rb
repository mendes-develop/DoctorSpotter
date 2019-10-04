class DoctorsController < ApplicationController

  def new

  end

  def index
    @doctors =  Doctor.where(set_doctor_params)
  end

  def show

    @doctor = find_doctor()

  end


  private

  def set_doctor_params
    params.require(:doctor).permit(:specialty_id, :insurance_id)
  end

  def find_doctor
    Doctor.find(params[:id])
  end

end
