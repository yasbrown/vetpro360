class AppointmentsController < ApplicationController
  def index
    @available_slots = Slot.where(available: true)
    @booked_appointments = Appointment.all.sort_by { |element| element.start_time }
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @slot = Slot.find(params[:slot_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)

    @slot = Slot.find(params[:slot_id])
    @appointment.slot = @slot

    @vet = Vet.find(params[:appointment][:vet_id])
    @appointment.vet = @vet

    @animal = Animal.find(params[:appointment][:animal_id])
    @appointment.animal = @animal

    @appointment.start_time = @slot.start_time
    @appointment.end_time = @slot.end_time

    @slot.available = false
    @slot.save!

    @appointment.save!
    redirect_to root_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:reason_for_appointment, :animal_id, :vet_id, :slot_id)
  end
end
