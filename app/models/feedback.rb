class Feedback < ApplicationRecord
  validates :name,
              presence: true,
              length: { in: 2..32 }
  validates :email,
              presence: true,
              length: { maximum: 64 },
              format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, "invalid email format" }
  validates :text,
              presence: true,
              length: { maximum: 500 }
end
