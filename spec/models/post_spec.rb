require 'spec_helper'

describe Post do
  let(:bucket) { FactoryGirl.create(:bucket, name: 'The Bucket') }
  let(:post) { FactoryGirl.build(:post, bucket: bucket) }

  context "attributes" do
    it "should have a name" do
      post.should respond_to(:name)
    end
    it "should have a description" do
      post.should respond_to(:description)
    end
    it "should have a url" do
      post.should respond_to(:url)
    end
  end
  context "validations" do
    it "should not allow for an empty name" do
      post.name = ''
      post.should_not be_valid
    end
    it "should not allow for an empty description" do
      post.description = ''
      post.should_not be_valid
    end
    it "should have an associated bucket" do
      post.bucket = nil
      post.should_not be_valid
    end
    it "should allow for valid url's" do
      post.url = 'http://www.google.com'
      post.should be_valid
    end
    it "should disallow invalid urls" do
      post.url = 'asdasdasd'
      post.should be_valid
    end
  end
  context "assocications" do
    it "should know about it's bucket" do
      post.bucket.should eq Bucket
    end
    it "should know about it's comments" do
      post.comments.should eq []
    end
  end
end
