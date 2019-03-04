class UsersController < ApplicationController
  def index
    @active_users= User.joins(:comments)
                        .group('users.id')
                        .where('comments.created_at >= ?', 1.week.ago.utc)
                        .order('count(comments.id) desc')
                        .limit(10)
                        .pluck(:name)
  end
end
