class AppointmentsController < ApplicationController
  before_action :set_pet, only: %i[new create]
  def index
    @appointments = policy_scope(Appointment).joins(:pet).where('pet.id = appointment.id')
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def new
    @appointment = Appointment.new # Needed to instantiate the form_with
    @appointment.pet = @pet
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.pet = @pet
    @appointment.user = current_user
    authorize @appointment
    if @appointment.save
    # No need for app/views/restaurants/create.html.erb
    # Tener OJOOOOOO de adonde se tendría que redireccionar
      redirect_to appointments_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def update
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.update(appointment_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@appointment)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to apointments_path, status: :see_other
  end

  private

  def appointment_params
    params.require(:appointment).permit(:veterinary_name, :doctor_name)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
