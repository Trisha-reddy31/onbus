class BusesController < ApplicationController
  def start
    @plan_id = params[:plan_id]

    @buses = [
      { name: "Express Line", seat_price: 25 },
      { name: "City Rider", seat_price: 15 },
      { name: "Comfort Cruiser", seat_price: 30 },
      { name: "Budget Bus", seat_price: 10 }
    ]

    render 'start_journey'
  end

  def book
    bus_name = params[:bus_name]
    fare = params[:fare].to_d
    plan_id = params[:plan_id]

    @booking = BusBooking.new(bus_name: bus_name, fare: fare)

    if @booking.save
      redirect_to booking_confirmation_path(@booking.pnr)
    else
      redirect_to start_journey_path(plan_id: plan_id), alert: "Failed to book the bus. Please try again."
    end
  end

  def confirmation
    @booking = BusBooking.find_by(pnr: params[:pnr])
    if @booking.nil?
      redirect_to start_journey_path, alert: "Booking not found."
    end
  end
end
