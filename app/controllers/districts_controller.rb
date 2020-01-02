class DistrictsController < ApplicationController
  before_action :find_district, only: [:edit, :update, :destroy]

  def index
    @districts =
        if params[:q]
          District.where('name ILIKE ?', "%#{params[:q]}%")
        else
          District.all.order(:completion_date)
        end
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(allowed_params)
    if @district.save
      flash[:notice] = 'УЗ было успешно создано'

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
    flash[:notice] = 'УЗ успешно удалено'

    redirect_to districts_path
  end

  private

  def find_district
    @district = District.find(params[:id])
  end

  def allowed_params
    params.require(:district).permit(
        :name,
        :decree_date,
        :completion_date,
        :performed
    )
  end
end
