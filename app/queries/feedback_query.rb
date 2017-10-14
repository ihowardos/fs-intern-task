class FeedbackQuery
  def initialize(base_relation = nil)
    base_relation = Feedback.all unless base_relation
    @relation = base_relation
  end

  def newest_feedbacks
    @relation.order(created_at: :desc)
  end
end
