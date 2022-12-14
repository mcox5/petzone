class TreatmentsController < ApplicationController
  before_action :set_pet, only: %i[new create]
  def index
    @treatments = policy_scope(Treatment)
  end

  def show
    @treatment = Treatment.find(params[:id])
    authorize @treatment
  end

  def new
    @treatment = Treatment.new # Needed to instantiate the form_with
    @treatment.pet = @pet
    authorize @treatment
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.pet = @pet
    @treatment.pet.user = current_user
    authorize @treatment
    date = @treatment.last_application + @treatment.interval
    if @treatment.save
      10.times do
        @meeting = Meeting.new
        @meeting.name = @treatment.name
        @meeting.start_time = date
        @meeting.user = @treatment.pet.user
        @meeting.pet_id = @pet.id
        @meeting.save
        date += @treatment.interval
      end
    # No need for app/views/restaurants/create.html.erb
    # Tener ojo de adonde se tendría que redireccionar
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
    authorize @treatment
  end

  def update
    @treatment = Treatment.find(params[:id])
    authorize @treatment
    @treatment.update(treatment_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@treatment.pet)
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    authorize @treatment
    @treatment.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pet_path(@treatment.pet), status: :see_other
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name, :last_application, :interval)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
