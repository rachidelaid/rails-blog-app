# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    # if user.admin?
    #   can :manage, :all
    # else
    #   can :destroy, Post do |post|
    #     post.author_id == user.id
    #   end

    #   can :create, Post
    #   can :create, Comment
    #   can :read, :all
    # end
    can :manage, :all
  end
end
