class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :description, length: { minimum: 2 }
  validates :movie_id, uniqueness: { scope: :user_id, message: "You've already made a comment!" }
end
