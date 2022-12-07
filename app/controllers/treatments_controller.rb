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
    @treatment = Treatment.new(pet_params)
    @treatment.pet = @pet
    @treatment.user = current_user
    authorize @treatment
    if @treatment.save
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
    redirect_to pet_path(@treatment)
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    authorize @treatment
    @treatment.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pets_path, status: :see_other
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name, :last_application, :interval)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
