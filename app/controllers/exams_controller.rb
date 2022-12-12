class ExamsController < ApplicationController
  before_action :set_pet, only: %i[new create show]
  def new
    @exam = Exam.new
    @exam.pet = @pet
    authorize @exam
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.pet = @pet
    authorize @exam
    if @exam.save
    # No need for app/views/restaurants/create.html.erb
    # Tener OJOOOOOO de adonde se tendría que redireccionar
    # Aca instancio la variable de meeting y le asigno sus valores segun la vacuna
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @exam = Exam.find(params[:id])
    authorize @exam
  end

  def edit
    @exam = Exam.find(params[:id])
    authorize @exam
  end

  def update
    @exam = Exam.find(params[:id])
    authorize @exam
    @exam.update(exam_params)
    # No need for app/views/pets/update.html.erb
    redirect_to pet_path(@exam.pet)
  end

  def destroy
    @exam = Exam.find(params[:id])
    @pet = @exam.pet
    authorize @exam
    @exam.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to pet_path(@pet), status: :see_other
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :description, :date, :photos)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
