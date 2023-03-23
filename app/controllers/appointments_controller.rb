class AppointmentsController < ApplicationController
  def index
    @all_slots = Slot.all
    @available_slots = Slot.where(available: true)
    @booked_appointments = Slot.where(available: false)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end
end
