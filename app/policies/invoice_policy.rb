class InvoicePolicy < ApplicationPolicy
  def show?
    user == record.user
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
