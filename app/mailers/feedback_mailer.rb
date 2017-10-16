class FeedbackMailer < ApplicationMailer

  def feedback(feedback)
    @feedback = feedback
    mail(
      to: ENV["GMAIL_USERNAME"],
      from: feedback.email,
      subject: "Feedback fs-intern-task")
  end
end
