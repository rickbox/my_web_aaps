# frozen_string_literal: true

require "rails_helper"
require "support/omniauth_macros"


describe User do
  it "メールアドレスとパスワードでサインインできる" do
    user = User.create(
      email: "hoge@gmail.com",
      password: "123456",
      password_confirmation: "123456"
    )
    expect(user).to be_valid
  end

  it "githubアカウントでサインインできる" do
    OmniAuth.config.mock_auth[:github] = nil
    Rails.application.env_config['omniauth.auth'] = github_mock
    user = User.create(
      name: "TestUser",
      email: "12345@sample.com",
      provider: "github",
      password: "password"
    )
    expect(User.exists?(email: "12345@sample.com")).to eq true
end
end
