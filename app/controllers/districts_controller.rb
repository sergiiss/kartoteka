class DistrictsController < ApplicationController
  before_action :find_district, only: %i[edit update show destroy]

  def index
    @districts =
        if params[:q]
          District.where('name ILIKE ?', "%#{params[:q]}%")
        else
          District.all.order(:name)
        end

    @not_completed_district_ids = District.not_completed.map(&:id)
  end

  def new
    @district = District.new
  end

  def show
    @quality_controls = @district.quality_controls.order(:name)
    @not_completed_quality_control_ids = QualityControl.not_completed.map(&:id)
  end

  def create
    @district = District.new(allowed_params)
    if @district.save
      flash[:notice] = 'Учреждение Здравоохранения было успешно создано'

      redirect_to districts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @district.update_attributes(allowed_params)
      redirect_to districts_path
    else
      render :edit
    end
  end

  def destroy
    @district.destroy
    flash[:notice] = 'Учреждение Здравоохранения успешно удалено'

    redirect_to districts_path
  end

  private

  def find_district
    @district = District.find(params[:id])
  end

  def allowed_params
    params.require(:district).permit(:name, :phone)
  end
end
