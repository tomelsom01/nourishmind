class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @yoga_class = YogaClass.find(params[:yoga_class_id])
    @bookings = @yoga_class.bookings
  end

  def new
    @yoga_class = YogaClass.find(params[:yoga_class_id])
    @booking = @yoga_class.bookings.build
  end

  def create
    @yoga_class = YogaClass.find(params[:yoga_class_id])
    @booking = @yoga_class.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @yoga_class, notice: 'Successfully booked the class.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_name, :yoga_class_id)
  end
end
