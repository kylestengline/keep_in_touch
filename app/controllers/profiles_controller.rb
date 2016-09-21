class ProfilesController < ApplicationController
#  before_action :authenticate_user!, only: [:index]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private

end
