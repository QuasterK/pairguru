require 'rails_helper'

describe Comment do
  it { is_expected.not_to allow_value("").for(:description) }
  it { is_expected.to allow_value("some random description").for(:description) }
end
