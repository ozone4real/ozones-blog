require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  # before(:all) do
  #   @user = User.create(id: 1, email:"jdjdjdj@gmail.com", password:"jdhdh", username: "uguobia", is_admin: true)
  #   payload = { id: @user.id, username: @user.username }
  #   token = JsonWebToken.encode(payload)
  #   get :index, session: {token: token}
  # end
  let(:user) { create(:user) }
  let(:token) do
    payload = { id: user.id, username: user.username }
    JsonWebToken.encode(payload)
  end
  context "GET new" do
    it "connects to the :new route" do
      get :new, session: { token: token }
      expect(response.status).to eq(200)
    end
  end

  context "POST create" do
    it "connects to the :create route and redirects to the all categories page if the category was successfully created" do
      post :create, params: { category: { name: "tech" } }, session: { token: token }
      # expect(response.status).to eq(200)
      expect(response).to redirect_to categories_path
    end

    it "renders a the new template if the category was not successfully created" do
      post :create, params: { category: { name: "" } }, session: { token: token }
      expect(response).to render_template(:new)
    end
  end

  context "GET all categories" do
    before(:each) do
      get :index, session: { token: token }
    end

    it "renders the categories index page" do
      expect(response).to render_template(:index)
    end
    # it "assigns @categories" do
    #   expect(assigns(:categories)).to be_a_new(Category)
    # end
  end
end
