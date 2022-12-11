class TreatmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user).first
    end
  end

  def show?
    record.pet.user == user # Gracias a device podemos llegar y poner solo user
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
