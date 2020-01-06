class QualityControlsController < ApplicationController
  before_action :find_quality_control, only: %i[edit update show destroy]
  before_action :find_district

  def index; end

  def new
    @quality_control = @district.quality_controls.build
  end

  def show
    @decrees = @quality_control.decrees.order(:name)
    @not_completed_decree_ids = Decree.not_completed.map(&:id)
  end

  def create
    @quality_control = QualityControl.new(allowed_params)
    if @quality_control.save
      flash[:notice] = 'Оценка качества была успешно создана'

      redirect_to district_path(@district)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @quality_control.update_attributes(allowed_params)
      redirect_to district_path(@district)
    else
      render :edit
    end
  end

  def destroy
    @quality_control.destroy
    flash[:notice] = 'Оценка качества успешно удалена'

    redirect_to district_path(@district)
  end

  private

  def find_district
    @district = District.find(params[:district_id])
  end

  def find_quality_control
    @quality_control = QualityControl.find(params[:id])
  end

  def allowed_params
    params.require(:quality_control).permit(:name, :decree_date, :district_id)
  end
end
