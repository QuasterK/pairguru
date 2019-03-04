require "rails_helper"

describe "Users request", type: :request do
  let!(:users) {create_list(:user, 10, :with_comments)}

  describe "users list" do
    it " displays users which have made most comments in last 7 days" do
      visit "/users"
      expect(page).to have_selector("table tr", count: 11)
    end
  end
end
