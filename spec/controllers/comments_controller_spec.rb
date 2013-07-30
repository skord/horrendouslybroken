require 'spec_helper'

describe CommentsController do
  let(:bucket) { FactoryGirl.create(:bucket) }
  let(:post) { FactoryGirl.create(:post, bucket: bucket) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:comment, post: post) }
  let(:valid_session) { {} }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:comment => valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:comment => valid_attributes}, valid_session
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, {:comment => valid_attributes}, valid_session
        response.should redirect_to(Comment.last)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }}, valid_session
        assigns(:post).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end
end
