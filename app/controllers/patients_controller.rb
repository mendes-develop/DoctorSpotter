class PatientsController < ApplicationController
  # before_action :find_patient, only: [:show, :edit, :update]
  skip_before_action :authenticated, only: [:new, :create] #, :show]

###### Create User Actions ########
  def new
    @patient = Patient.new
  end

  def create
    if password_confirmation?
      @patient = Patient.create(set_patient_params)
      validate_patient_signup()
    else
      flash[:errors] = ["Passwords don't match. Please, try it again"]
      redirect_to new_patient_path()
    end
  end
########################################

######## Existing User Actions ##########
  def show

  end

  def edit

  end

  def update
    if password_confirmation?
      @current_patient.update(set_patient_params)
      redirect_to patient_path(@current_patient)
    else
      flash[:errors] = ["Passwords don't match. Please, try it again"]
      redirect_to edit_patient_path(@current_patient)
    end
  end

  def destroy
    @current_patient.destroy
    redirect_to login_path
  end


  private

#### Find patient and set params ##############
  # def find_patient
  #   @patient = Patient.find(params[:id])
  #   return @patient
  # end

  def set_patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end



######## New User Methods ########
  def password_confirmation?
    if (params[:patient][:password] == params[:patient][:password_confirmation]) && !params[:patient][:password].empty?
      # byebug
      return true
    else
      return false
    end
  end

  def validate_patient_signup
    # byebug
    if @patient.valid?
      session[:patient_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:errors] = @patient.errors.full_messages
      redirect_to new_patient_path()
    end
  end


end
