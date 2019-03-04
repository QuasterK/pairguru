require 'rails_helper'

describe CommentsController do
  let(:user) {FactoryBot.build(:user)}
  let(:movie) {FactoryBot.build(:movie)}
  let(:comment) {FactoryBot.build(:comment)}

  # describe 'get index' do
  #   it { should route(:get, '/comments/index').to(action: :index) }
  # end

  describe 'post #create' do
    it { should route(:post, '/comments_create').to(action: :create) }
  end

  describe 'delete #destroy' do
    it { should route(:delete, '/delete_comment').to(action: :destroy) }
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new comment" do
        expect{
          comment.save
        }.to change(Comment,:count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not save new comment" do
        comment.save
        expect{
          new_comment = comment
          new_comment.save
        }.to_not change(Comment,:count)
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      comment.save
    end

    it "deletes the comment" do
      expect{
        comment.destroy
      }.to change(Comment,:count).by(-1)
    end
  end

end
