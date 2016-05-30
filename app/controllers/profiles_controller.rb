class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :set_user

  def show
    render json: @user.profile
  end

  def update
    authorize @user.profile
    if @user.profile.update(profile_params)
      head :no_content
    else
      render json: @user.profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :subtitle, :url, :avatar)
  end
end