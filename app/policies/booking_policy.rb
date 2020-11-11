class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
<<<<<<< HEAD
  
  def index?
    true
  end
=======

  def new?
    true
  end

  def create?
    true
  end


>>>>>>> master
end
