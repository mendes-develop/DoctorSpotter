class ApplicationController < ActionController::Base
    before_action :authenticated
    helper_method :logged_in?

    private

    def current_patient
        @current_patient = Patient.find_by(id: session[:patient_id])
    end

    def logged_in?
        !current_patient.nil?
    end

    def authenticated
        redirect_to login_path unless logged_in?
    end
end
