class BookingsController < ApplicationController
  def create
    @yoga_class = YogaClass.find(params[:yoga_class_id])
    @booking = @yoga_class.bookings.build(booking_params)
    if @booking.save
      redirect_to @yoga_class, notice: 'Successfully booked the class.'
    else
      render 'yoga_classes/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_name)
  end
end
