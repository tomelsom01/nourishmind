class Users::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_classes = current_user.yoga_classes
  end
end
