require 'rails_helper'

describe Comment do
  it { is_expected.not_to allow_value("").for(:description) }
  it { is_expected.to allow_value("some random description").for(:description) }
  it {is_expected.to validate_uniqueness_of(:movie_id).scoped_to(:user_id).with_message("You've already made a comment!")}
end
