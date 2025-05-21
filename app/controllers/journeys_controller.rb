class JourneysController < ApplicationController
  before_action :authenticate_user!

  def start
    @plan_id = params[:plan_id]
    @buses = [
    { name: "Express Line", seat_price: 500 },
    { name: "City Rider", seat_price: 400 },
    { name: "Comfort Cruiser", seat_price: 300 },
    { name: "Budget Bus", seat_price: 200 }
  ]
    render 'start_journey'
  end
  
  

  def select_seat
    @bus_id = params[:bus_id]
    # Sample bus layout data - can be dynamic
    @seats = (1..20).to_a
  end

  def confirm_booking
    seat_number = params[:seat_number]
    bus_id = params[:bus_id]

    # Here you would save the booking
    flash[:notice] = "Seat ##{seat_number} booked successfully!"

    redirect_to booking_confirmation_journeys_path(id: bus_id)
  end

  def booking_confirmation
    @bus_id = params[:id]
  end

  def confirmation
    @booking = BusBooking.find_by(pnr: params[:pnr])
    if @booking.nil?
      redirect_to start_journey_path, alert: "Booking not found."
    end
  end
end
