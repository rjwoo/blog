require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  
  describe "#new" do
    it "renders a new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "initiates a new post instance variable" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "#create" do
    context "if user is signed in" do

      before { request.session[:user_id] = user.id }

      context "with valid attributes" do
        def valid_request
          post :create, post:
          FactoryGirl.attributes_for(:post)
        end

        it "saves a record to the database" do
          count_before = Post.count
          valid_request
          count_after = Post.count
          expect(count_after).to eq(count_before + 1)
        end

        it "redirects to the show page of the post" do
          valid request
          expect(response).to redirect_to(root_path)
        end

        it "sets a flash notice message"
      end
    end

  context "if user is not signed in" do

    it "redirects to the show page"
    it "flashes a message"

  end

    context "with invalid attributes" do
      it "doesn't save a record to the database"
      it "renders the new template"
    end
  end

  describe "#show"
  describe "#index"
end
