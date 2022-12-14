class VaccinesController < ApplicationController
  before_action :set_pet, only: %i[new create]
  def new
    @vaccine = Vaccine.new
    @vaccine.pet = @pet
    authorize @vaccine
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    @vaccine.pet = @pet
    authorize @vaccine
    if @vaccine.save
      # No need for app/views/restaurants/create.html.erb
      # Tener OJOOOOOO de adonde se tendría que redireccionar
      # Aca instancio la variable de meeting y le asigno sus valores segun la vacuna
      @meeting = Meeting.new
      @meeting.name = @vaccine.name
      @meeting.start_time = @vaccine.date + @vaccine.interval
      @meeting.user = @vaccine.pet.user
      @meeting.pet = @pet
      @meeting.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vaccine = Vaccine.find(params[:id])
    authorize @vaccine
  end

  def update
    @vaccine = Vaccine.find(params[:id])
    authorize @vaccine
    @vaccine.update(vaccine_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@vaccine.pet)
  end

  def destroy
    @vaccine = Vaccine.find(params[:id])
    @pet = @vaccine.pet
    authorize @vaccine
    @vaccine.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pet_path(@pet), status: :see_other
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:name, :interval, :date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
