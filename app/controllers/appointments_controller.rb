class AppointmentsController < ApplicationController
  before_action :set_pet, only: %i[new create ]
  # El index no tiene vista creada ya que mostraremos la info en el show de pets
  def index
    @appointments = policy_scope(Appointment).joins(:pet).where('pet.id = appointment.id')
  end

  def show
    @appointment = Appointment.find(params[:id])
    @appointment.build_apply
    authorize @appointment
  end

  def new
    @appointment = Appointment.new # Needed to instantiate the form_with
    @appointment.pet = @pet
    # @appointment.applies.build
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.pet = @pet
    authorize @appointment
    if @appointment.save
    # No need for app/views/restaurants/create.html.erb
    # Tener OJOOOOOO de adonde se tendría que redireccionar
      @meeting = Meeting.new
      @meeting.name = @appointment.veterinary_name
      @meeting.start_time = @appointment.date
      @meeting.user = @appointment.pet.user
      @meeting.pet = @pet
      @meeting.save
      redirect_to pet_path(@pet)
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
    redirect_to pet_path(@appointment.pet)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @pet = @appointment.pet
    authorize @appointment
    @appointment.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pet_path(@pet), status: :see_other
  end

  private

  def appointment_params
    params.require(:appointment).permit(:veterinary_name, :doctor_name, :date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
