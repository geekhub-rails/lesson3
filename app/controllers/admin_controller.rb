class AdminController < ApplicationController
  before_action :must_be_admin

  def index
    @users = User.all
    render "dashboard"
  end

  def showEdit
    @user = User.find_by(id: params[:id])
    render "edit"
  end

  def showCreate
    @user = User.create
    render "new"
  end

  def create
    @user = User.new({name: params[:user][:name], email: params[:user][:email], admin: false, password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]})
    if @user.save
      redirect_to '/admin/dashboard'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to '/admin/dashboard'
    end
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user && @user.destroy
    index
  end

  def must_be_admin
    unless current_user && current_user.admin
      redirect_to root_path, notice: "Admin Needed."
    end
  end

  private
  def user_params
    params.require(:user).permit(:role, :name)
  end
end
