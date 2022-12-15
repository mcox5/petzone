class DewormingsController < ApplicationController
  before_action :set_pet, only: %i[new create]
  def new
    @deworming = Deworming.new
    @deworming.pet = @pet
    authorize @deworming
  end

  def create
    @deworming = Deworming.new(deworming_params)
    @deworming.pet = @pet
    authorize @deworming
    if @deworming.save
    # No need for app/views/restaurants/create.html.erb
    # Tener OJOOOOOO de adonde se tendría que redireccionar
      @meeting = Meeting.new
      @meeting.name = @deworming.name
      @meeting.start_time = @deworming.date + @deworming.interval
      @meeting.user = @deworming.pet.user
      @meeting.pet = @pet
      @meeting.deworming_id = @deworming.id
      @meeting.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @deworming = Deworming.find(params[:id])
    authorize @deworming
  end

  def update
    @deworming = Deworming.find(params[:id])
    authorize @deworming
    @deworming.update(deworming_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@deworming.pet)
  end

  def destroy
    @deworming = Deworming.find(params[:id])
    @pet = @deworming.pet
    authorize @deworming
    @deworming.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pet_path(@pet), status: :see_other
  end

  private

  def deworming_params
    params.require(:deworming).permit(:name, :interval, :date)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
