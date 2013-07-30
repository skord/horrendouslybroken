require 'spec_helper'

describe BucketsController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:bucket) }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all buckets as @buckets" do
      bucket = Bucket.create! valid_attributes
      get :index, {}, valid_session
      assigns(:buckets).should eq([bucket])
    end
  end

  describe "GET show" do
    it "assigns the requested bucket as @bucket" do
      bucket = Bucket.create! valid_attributes
      get :show, {:id => bucket.to_param}, valid_session
      assigns(:bucket).should eq(bucket)
    end
  end

  describe "GET new" do
    it "assigns a new bucket as @bucket" do
      get :new, {}, valid_session
      assigns(:bucket).should be_a_new(Bucket)
    end
  end

  describe "GET edit" do
    it "assigns the requested bucket as @bucket" do
      bucket = Bucket.create! valid_attributes
      get :edit, {:id => bucket.to_param}, valid_session
      assigns(:bucket).should eq(bucket)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bucket" do
        expect {
          post :create, {:bucket => valid_attributes}, valid_session
        }.to change(Bucket, :count).by(1)
      end

      it "assigns a newly created bucket as @bucket" do
        post :create, {:bucket => valid_attributes}, valid_session
        assigns(:bucket).should be_a(Bucket)
        assigns(:bucket).should be_persisted
      end

      it "redirects to the created bucket" do
        post :create, {:bucket => valid_attributes}, valid_session
        response.should redirect_to(Bucket.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bucket as @bucket" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bucket.any_instance.stub(:save).and_return(false)
        post :create, {:bucket => {  }}, valid_session
        assigns(:bucket).should be_a_new(Bucket)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bucket.any_instance.stub(:save).and_return(false)
        post :create, {:bucket => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bucket" do
        bucket = Bucket.create! valid_attributes
        # Assuming there are no other buckets in the database, this
        # specifies that the Bucket created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bucket.any_instance.should_receive(:update).with({ "name" => "bucket name" })
        put :update, {:id => bucket.to_param, :bucket => { "name" => "bucket name" }}, valid_session
      end

      it "assigns the requested bucket as @bucket" do
        bucket = Bucket.create! valid_attributes
        put :update, {:id => bucket.to_param, :bucket => valid_attributes}, valid_session
        assigns(:bucket).should eq(bucket)
      end

      it "redirects to the bucket" do
        bucket = Bucket.create! valid_attributes
        put :update, {:id => bucket.to_param, :bucket => valid_attributes}, valid_session
        response.should redirect_to(bucket)
      end
    end

    describe "with invalid params" do
      it "assigns the bucket as @bucket" do
        bucket = Bucket.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bucket.any_instance.stub(:save).and_return(false)
        put :update, {:id => bucket.to_param, :bucket => {  }}, valid_session
        assigns(:bucket).should eq(bucket)
      end

      it "re-renders the 'edit' template" do
        bucket = Bucket.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bucket.any_instance.stub(:save).and_return(false)
        put :update, {:id => bucket.to_param, :bucket => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bucket" do
      bucket = Bucket.create! valid_attributes
      expect {
        delete :destroy, {:id => bucket.to_param}, valid_session
      }.to change(Bucket, :count).by(-1)
    end

    it "redirects to the buckets list" do
      bucket = Bucket.create! valid_attributes
      delete :destroy, {:id => bucket.to_param}, valid_session
      response.should redirect_to(buckets_url)
    end
  end

end
