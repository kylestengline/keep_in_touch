class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

#  before_action :find_user, only: [:index, :show]

  def index
  end

  def show
  end

  private

end
