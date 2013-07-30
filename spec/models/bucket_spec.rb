require 'spec_helper'

describe Bucket do
  let(:bucket) { FactoryGirl.create(:bucket, name: 'The Bucket') }
  context "attributes" do
    it "should have a name" do
      bucket.should respond_to(:name)
    end

    it "should have a description" do
      bucket.should respond_to(:description)
    end
  end
  context "validations" do
    it "should have a unique name" do
      new_bucket = FactoryGirl.build(:bucket, name: 'The Bucket')
      new_bucket.should_not be_valid
    end

    it "should require a name" do
      bucket.name = ''
      bucket.should_not be_valid
    end

    it "should have a name be no longer than 64 characters" do
      bucket.name = Faker::Lorem.characters(65)
      bucket.should_not be_valid
    end

    it "should require a description" do
      bucket.description = ''
      bucket.should_not be_valid
    end

    it "should allow for a description no longer than 1500 characters" do
      bucket.description = Faker::Lorem.characters(1501)
      bucket.should_not be_valid
    end

    it "should allow for descriptions between 1 and 1499 characters in length" do
      lil_bucket = FactoryGirl.create(:bucket, name: 'lil bucket')
      big_bucket = FactoryGirl.create(:bucket, name: 'big bucket')
      big_bucket.description = Faker::Lorem.characters(1499)
      lil_bucket.description = Faker::Lorem.characters(1)

      big_bucket.should be_valid
      lil_bucket.should be_valid
    end
  end

  context "associations" do
    let(:post_1) { FactoryGirl.create(:post, name: 'Post 1', bucket: bucket) }
    let(:post_2) { FactoryGirl.create(:post, name: 'Post 2', bucket: bucket) }
    it "should know if its posts" do
      bucket.should respond_to(:posts)
    end
    it "should have posts of class Post" do
      bucket.posts.all {|post| post.is_a?(Post)}.should be_true
    end
  end
end
