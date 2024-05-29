class BookingsController < ApplicationController
  def create
    @yoga_class = YogaClass.find(params[:yoga_class_id])
    @booking = @yoga_class.bookings.build(user: current_user)

    if @booking.save
      redirect_to @yoga_class, notice: 'Successfully booked!'
    else
      redirect_to @yoga_class, alert: 'Booking failed.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.yoga_class, notice: 'Booking cancelled.'
  end
end
