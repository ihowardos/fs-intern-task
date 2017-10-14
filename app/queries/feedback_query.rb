class FeedbackQuery
  def initialize(base_relation = nil)
    base_relation = Feedback.all unless base_relation
    @relation = base_relation.extending(Scopes)
  end

  def relation
    @relation
  end

  module Scopes
    def newest_feedbacks
      order(created_at: :desc)
    end

    def pagination(page)
      page(page).per(10)
    end

    def search(search)
      where("name ILIKE ? OR email ILIKE ?", "%#{search}%", "%#{search}%")
    end
  end
end
