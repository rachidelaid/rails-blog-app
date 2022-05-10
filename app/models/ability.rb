class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    p params
    if user.admin?
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.author_id == user.id
      end

      can :destroy, Comment do |comment|
        comment.author_id == user.id
      end

      can :create, Post do |_post|
        user.id
      end

      can :create, Comment do |_comment|
        user.id
      end

      can :read, :all
    end
  end
end
