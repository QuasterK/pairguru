class Comment < ApplicationRecord
  belongs_to :user, :movie
  validates :movie_id, uniqueness: { scope: :user_id, message: "You'vecalready commented this movie!" }
end
