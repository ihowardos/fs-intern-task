class FeedbackMailer < ApplicationMailer

  def feedback(feedback)
    @feedback = feedback
    mail(
      to: "admin@example.com",
      from: feedback.email,
      subject: "Feedback fs-intern-task")
  end
end
