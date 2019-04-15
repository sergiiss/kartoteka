class PatientsController < ApplicationController
  before_action :find_patient, only: [:edit, :update, :destroy]

  def index
    @patients =
      if params[:q]
        Patient.where('middle_name ILIKE ?', "%#{params[:q]}%")
      else
        Patient.all.order(:next_visit_date)
      end
  end

  def current
    @patients = Patient.order(:next_visit_date).current_month
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(allowed_params)
    if @patient.save
      flash[:notice] = 'Patient created'

      redirect_to patients_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update_attributes(allowed_params)
      redirect_to patients_path
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    flash.notice = 'Ваш пациент успешно удален'

    redirect_to patients_path
  end

  private

  def find_patient
    @patient = Patient.find(params[:id])
  end

  def allowed_params
    params.require(:patient).permit(
      :identifier,
      :first_name,
      :middle_name,
      :last_name,
      :age,
      :address,
      :phone,
      :diagnosis,
      :operation_date,
      :visit_date,
      :next_visit_date
    )
  end
end
