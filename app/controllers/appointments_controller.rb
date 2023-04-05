class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :destroy]
  before_action :set_slot, only: [:new, :create]

  def index
    @available_slots = Slot.where(available: true).sort_by { |element| element.start_time }
    @booked_appointments = Appointment.all.sort_by { |element| element.start_time }
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.slot = @slot

    vet = VetAttribute.find(params[:appointment][:vet_attribute_id])
    @appointment.vet_attribute = vet

    animal = Animal.find(params[:appointment][:animal_id])
    @appointment.animal = animal

    @appointment.start_time = @slot.start_time
    @appointment.end_time = @slot.end_time

    @slot.available = false
    @slot.save!

    @appointment.save!
    redirect_to root_path
  end

  def destroy
    slot = @appointment.slot
    slot.available = true
    slot.save!
    @appointment.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_slot
    @slot = Slot.find(params[:slot_id])
  end

  def appointment_params
    params.require(:appointment).permit(:reason_for_appointment, :animal_id, :vet_attribute_id, :slot_id)
  end
end
