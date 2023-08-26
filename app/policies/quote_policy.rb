class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    true
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    record.user == user || user.admin
  end

  def destroy?
    record.user == user.id || user.admin
  end
end
