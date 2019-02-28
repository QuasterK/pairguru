class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :description, length: { minimum: 2 }
end
