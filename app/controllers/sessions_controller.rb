class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:login, :verification]

  def login
    render :login
  end

  def verification
    @patient = Patient.find_by(email: params[:email])

    if @patient && @patient.authenticate(params[:password])
      session[:patient_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:errors] = ["Email or password invalid. Please, try it again"]
      redirect_to login_path
    end

  end

  def logout
    session.delete(:patient_id)
    redirect_to login_path
  end


end
