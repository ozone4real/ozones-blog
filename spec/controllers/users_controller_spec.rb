require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:valid_user) { {username: "ozone", email: "ezenwaogbonna1@gmail.com", password: "ozone4life" }}
  let(:invalid_user) {{username: "090", email: "jhfhfhh", password: "ozone4real"}}
  let(:taken_user) {create :user}
  context "signup test" do
  it "signs up a user successfully ifnthe user data is valid" do
    post :signup_user, params: valid_user
    expect(response.status).to eq(201)
    expect(response.body).to include("token")
  end

  it "fails if the user data is invalid" do
    post :signup_user, params: invalid_user
    expect(response.status).to eq(409)
  end
  it "fails if the email is already taken" do
    p taken_user
    post :signup_user, params: taken_user.attributes
    expect(response.status).to eq(409)
  end
  end
  
end
