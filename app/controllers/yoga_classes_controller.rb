class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end

  def show
    @yoga_class = YogaClass.find(params[:id])
    @booking = Booking.new
  end
end
