require 'spec_helper'

describe "user", type: :api do
  let!(:user) { Fabricate :user }

  describe "get user" do
    before :each do
      get "/users/#{user.auth_token}.json"
      @response = response
      @user_response = JSON.parse(@response.body)
    end

    it "returns a 200 status" do
      @response.status.should == 200
    end

    it "returns the user's first name" do
      @user_response["first_name"].should == user.first_name
    end

    it "returns the user's last name" do
      @user_response["last_name"].should == user.last_name
    end

    it "returns the user's email" do
      @user_response["email"].should == user.email
    end
  end

  describe "create user" do
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email(Faker::Company.name) }
    let(:password) { Faker::Lorem.words(2).join("chuckles") }

    it "creates a user" do
      post "/users.json", user: {
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password
      }.as_json
      response.status.should == 201
    end

    it "rejects a user without an email address" do
      post "/users.json", user: {
        first_name: first_name,
        last_name: last_name,
        password: password,
        password_confirmation: password
      }.as_json
      response.status.should == 400
    end

    it "rejects a user without a first name" do
      post "/users.json", user: {
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password
      }.as_json
      response.status.should == 400
    end

    it "rejects a user without a last name" do
      post "/users.json", user: {
        first_name: first_name,
        email: email,
        password: password,
        password_confirmation: password
      }.as_json
      response.status.should == 400
    end

    it "rejects a user without a password" do
      post "/users.json", user: {
        first_name: first_name,
        last_name: last_name,
        email: email,
      }.as_json
      response.status.should == 400
    end

    it "rejects mismatched password confirmations" do
      post "/users.json", user: {
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: "ubv893kjvb84jvb83jdjnw93w"
        }.as_json
      response.status.should == 400
    end
  end

  describe "update user" do
    let!(:user_1) { Fabricate :user }

    it "updates a user's firstname" do
      put "/users/#{user_1.auth_token}.json", :user => {
        first_name: "Jay",
        }.as_json
      response.status.should == 204  
      User.find_by_first_name("Jay").should_not be_nil
      get "/users/#{user_1.auth_token}.json"
      response.body.should include "Jay"
    end

    it "updates a user's last name" do
      put "/users/#{user_1.auth_token}.json", :user => {
        last_name: "Son",
        }.as_json
      response.status.should == 204  
      User.find_by_last_name("Son").should_not be_nil
      get "/users/#{user_1.auth_token}.json"
      response.body.should include "Son"
    end

    it "updates a user's email address" do
      put "/users/#{user_1.auth_token}.json", :user => {
        email: "new@email.com",
        }.as_json
      response.status.should == 204  
      User.find_by_email("new@email.com").should_not be_nil
      get "/users/#{user_1.auth_token}.json"
      response.body.should include "new@email.com"
    end

  end

  describe "destroy user" do
    it "destroys the user" do
      delete "/users/#{user.auth_token}.json"
      response.status.should == 204
      User.find_by_auth_token(user.auth_token).should be_is_a(NilClass)
    end
  end

end
