class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, Event
    can :create, User

    if user
      if user.role? :god
        can :manage, :all
      else
        if user.role?(:girl) || user.role?(:chibi_mama) || user.role?(:mama)
          can :update, User, :id => user.id
          can :show, User
          can :index, Event
        end
        if user.role?(:chibi_mama) || user.role?(:mama)
          can [:index,:update], User
        end
        if user.role? :mama
          can [:edit_roles, :update_roles, :destroy], User
          can [:new,:create,:edit,:update,:destroy], Event
        end
      end
    end
  end
end
