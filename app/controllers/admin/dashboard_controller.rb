class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @yoga_classes = YogaClass.all.includes(:users)
  end
end
