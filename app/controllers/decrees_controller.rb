class DecreesController < ApplicationController
  before_action :find_decree, only: %i[edit update show destroy]
  before_action :find_necessary_data

  def index; end

  def new
    @decree = Decree.new
  end

  def show
    @paragraphs = @decree.paragraphs.order(:completion_date)
    @not_completed_paragraph_ids = Paragraph.not_completed.map(&:id)
  end

  def create
    @decree = Decree.new(allowed_params)
    if @decree.save
      flash[:notice] = 'Приказ был успешно создан'

      redirect_to district_quality_control_path(@district, @quality_control)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @decree.update_attributes(allowed_params)
      redirect_to district_quality_control_path(@district, @quality_control)
    else
      render :edit
    end
  end

  def destroy
    @decree.destroy
    flash[:notice] = 'Приказ успешно удален'

    redirect_to district_quality_control_path(@district, @quality_control)
  end

  private

  def find_decree
    @decree = Decree.find(params[:id])
  end

  def find_necessary_data
    @district = District.find(params[:district_id])
    @quality_control = QualityControl.find(params[:quality_control_id])
  end

  def allowed_params
    params.require(:decree).permit(:identifier, :name, :date, :option, :quality_control_id)
  end
end
