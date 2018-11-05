class UsersController < ApplicationController
  before_action :show, only: %i[show edit update destroy]
  before_action :authenticate_admin!, only: %i[new show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render 'index'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to action: 'index'
  end

  def authenticate_admin!
    unless current_user.admin?
      render plain: 'You dont have permissoins to see this page'
      end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
