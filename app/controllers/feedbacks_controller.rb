class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose_decorated :feedbacks, -> { fetch_feedbacks }

  def index
    authorize feedback
  end

  def new
    if current_user
      feedback.name = current_user.full_name
      feedback.email = current_user.email
    end
    authorize feedback
  end

  def create
    FeedbackMailer.feedback(feedback).deliver_now if feedback.save
    respond_with(feedback, location: new_feedback_path)
  end

  private
    def fetch_feedbacks
      feedbacks = FeedbackQuery.new.newest_feedbacks
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end
end
