require 'rails_helper'

describe 'movies/show.html.haml' do
  before do
    @movie = FactoryBot.create(:movie)
    @comment = FactoryBot.create(:comment)
    @comments = Comment.all
    @user = FactoryBot.create(:user)
    controller.singleton_class.class_eval do
      protected
        def current_user
          User.first
        end
        helper_method :current_user
      end
  end

  it "displays the movie title" do
    render
    assert_select 'h1', @movie.title
  end
  
  context "user_signed_in" do
    before do
      controller.singleton_class.class_eval do
        protected
          def user_signed_in?
            true
          end
          helper_method :user_signed_in?
        end
    end

    it "should render comment_form" do
      render
      assert_select '#form'
    end

    it "should render comments partial" do
      render
      assert_select '#comments'
    end
  end

  context "user signed_out" do
    before do
      controller.singleton_class.class_eval do
        protected
          def user_signed_in?
            false
          end
          helper_method :user_signed_in?
        end
    end
    it 'should render comments' do
      render :partial => 'comments'
      assert_select '#comments'
    end

    it 'checks for loged_in access' do
      render
      assert_select '#form', false
    end

  end

end
