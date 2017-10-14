class FeedbacksController < ApplicationController
  expose_decorated :feedback
  expose_decorated :feedbacks, -> { fetch_feedbacks }

  def create

  end

  private
    def fetch_feedbacks
      feedbacks = Feedback.all
    end

    def feedback_params
      params.require(:feedbacks).permit(:name, :email, :text)
    end
end
