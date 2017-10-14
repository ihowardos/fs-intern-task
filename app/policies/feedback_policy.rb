class FeedbackPolicy < ApplicationPolicy
  def index?
    user && user.role
  end

  def new?
    true
  end
end
