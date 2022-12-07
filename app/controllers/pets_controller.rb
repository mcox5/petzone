class PetsController < ApplicationController

  def index
    @pets = policy_scope(Pet)
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new # Needed to instantiate the form_with
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
    # No need for app/views/restaurants/create.html.erb
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.update(pet_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pets_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :birthday, :gender, :weight, :spayed, :photos, :allergies, :color, :chiped, :type)
  end
end
