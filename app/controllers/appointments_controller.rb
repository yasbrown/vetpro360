class AppointmentsController < ApplicationController
  def index
    @all_slots = Slot.all
    @available_slots = Slot.where(available: true)
    @booked_appointments = Appointment.all
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
    @vet = Vet.find(params[:vet_id])
    @appointment.vet = @vet
    @animal = Animal.find(params[:animal_id])
    @appointment.animal = @animal
    @slot.available = false
    @appointment.save!
    redirect_to root_path
  end
end
