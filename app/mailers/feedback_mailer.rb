class FeedbackMailer < ApplicationMailer

  def feedback(feedback)
    @feedback = feedback
    mail(
      to: ENV["USERNAME"],
      from: feedback.email,
      subject: "Feedback fs-intern-task")
  end
end
