class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update] # probably want to keep using this

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # # GET /users/1
  # # GET /users/1.json
  def show
    @user = User.find_by(id: params[:id])
    render ''
  end

  # GET /users/1/edit
  def edit

  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }
    end
  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:role, :name)
  end

end