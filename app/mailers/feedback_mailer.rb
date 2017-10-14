class FeedbackMailer < ApplicationMailer

  def feedback(feedback)
    @feedback = feedback
    mail(
      to: "admin@example.com",
      from: feedback.email,
      name: feedback.name,
      subject: feedback.text)
  end
end
