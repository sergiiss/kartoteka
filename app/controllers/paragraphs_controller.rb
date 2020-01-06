class ParagraphsController < ApplicationController
  before_action :find_paragraph, only: %i[edit update show destroy]
  before_action :find_necessary_data

  def index; end

  def new
    @paragraph = Paragraph.new
  end

  def show; end

  def create
    @paragraph = Paragraph.new(allowed_params)
    if @paragraph.save
      flash[:notice] = 'Пункт приказа был успешно создан'

      redirect_to district_quality_control_decree_url(@district, @quality_control, @decree)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @paragraph.update_attributes(allowed_params)
      redirect_to district_quality_control_decree_url(@district, @quality_control, @decree)
    else
      render :edit
    end
  end

  def destroy
    @paragraph.destroy
    flash[:notice] = 'Пункт приказа успешно удален'

    redirect_to district_quality_control_decree_url(@district, @quality_control, @decree)
  end

  private

  def find_paragraph
    @paragraph = Paragraph.find(params[:id])
  end

  def find_necessary_data
    @district = District.find(params[:district_id])
    @quality_control = QualityControl.find(params[:quality_control_id])
    @decree = Decree.find(params[:decree_id])
  end

  def allowed_params
    params.require(:paragraph).permit(:todo, :completion_date, :performed, :decree_id)
  end
end
