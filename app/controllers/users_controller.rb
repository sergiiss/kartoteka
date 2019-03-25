class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      flash[:notice] = 'User created'

      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(allowed_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def allowed_params
    params.require(:user).permit(
      :identifier,
      :first_name,
      :middle_name,
      :last_name,
      :age,
      :address,
      :phone,
      :diagnosis,
      :date_operation,
      :interval
    )
  end
end
