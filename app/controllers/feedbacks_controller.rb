class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose_decorated :feedbacks, -> { fetch_feedbacks }

  def new
    if current_user
      feedback.name = current_user.full_name
      feedback.email = current_user.email
    end
  end

  def create
    FeedbackMailer.feedback(feedback).deliver_now if feedback.save
    respond_with(feedback, location: new_feedback_path)
  end

  private
    def fetch_feedbacks
      feedbacks = Feedback.all
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end
end
