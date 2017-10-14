class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose_decorated :feedbacks, -> { fetch_feedbacks }

  def create
    FeedbackMailer.feedback(feedback).deliver_now if feedback.save
    respond_with(feedback)
  end

  private
    def fetch_feedbacks
      feedbacks = Feedback.all
    end

    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end
end
