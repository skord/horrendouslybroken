require 'spec_helper'

describe Comment do
  let(:bucket) { FactoryGirl.create(:bucket, name: 'A Bucket') }
  let(:post) { FactoryGirl.create(:post, bucket: bucket) }
  let(:user) { FactoryGirl.create(:user) }
  let(:comment) { FactoryGirl.build(:comment, post: post) }

  context "attributes" do
    it "should have a body" do
      comment.should respond_to(:body)
    end
  end
  context "validations" do
    it "should not allow for an empty body" do
      comment.body = ''
      comment.should_not be_valid
    end
    it "should not allow for a body over 1500 characters" do
      comment.body = Faker::Lorem.characters(1501)
      comment.should_not be_valid
    end
  end
  context "associations" do
    it "should know about it's owner" do
      comment.user.should eq user
    end
  end
end
