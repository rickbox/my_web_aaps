# frozen_string_literal: true

require "rails_helper"

feature "ログイン" do
  background do
    # ユーザを作成する
    User.create(email: "foo@example.com", password: "123456")
  end
  scenario "ログインする" do
    # トップページを開く
    visit root_path

    # ログインフォームにEmailとパスワードを入力する
    fill_in "user_email", with: "foo@example.com"
    fill_in "user_password", with: "123456"

    # ログインボタンをクリックする
    click_button "ログイン"

    # ログインに成功したことを検証する
    expect(page).to have_content "ログインしました"
  end
end
