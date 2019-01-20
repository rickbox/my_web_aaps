# frozen_string_literal: true

require "rails_helper"

feature "一覧、登録" do
  background do
    # ユーザを作成する
    User.create(email: "foo@example.com", password: "123456")
    visit root_path
    fill_in "user_email", with: "foo@example.com"
    fill_in "user_password", with: "123456"
    click_button "ログイン"
  end

  scenario "ログインしたユーザーは一覧ページを閲覧できる" do
    # 一覧ページを開く
    visit root_path
    # 一覧ページを開けたことを検証する
    expect(page).to have_content "一覧"
  end

  scenario "ログインしたユーザーは本を登録できる" do
    # 一覧ページを開く
    visit root_path
    # 登録ページを開く
    click_link "登録"
    # 登録ページを開けたことを検証する
    expect(page).to have_css "h1", text: "登録"
    # 本を登録する
    fill_in "book_title", with: "タイトル1"
    fill_in "book_memo", with: "メモ1"
    fill_in "book_author", with: "rickbox"
    click_button "登録する"
    # 本が登録されたことを検証する
    expect(page).to have_content "登録完了"
  end
end

feature "詳細、編集、削除" do
  background do
    # ユーザを作成する
    User.create(email: "foo@example.com", password: "123456")
    visit root_path
    fill_in "user_email", with: "foo@example.com"
    fill_in "user_password", with: "123456"
    click_button "ログイン"
    # 本を登録する
    visit root_path
    click_link "登録"
    fill_in "book_title", with: "タイトル1"
    fill_in "book_memo", with: "メモ1"
    fill_in "book_author", with: "rickbox"
    click_button "登録する"
    visit root_path
  end

  scenario "ログインしたユーザーは詳細ページを閲覧できる" do
    # 詳細ページを開く
    click_link "詳細"
    # 詳細ページを開けたことを証明する
    expect(page).to have_css "h1", text: "詳細"
  end

  scenario "ログインしたユーザーは本の情報を編集できる" do
    # 編集ページを開く
    click_link "編集"
    # 編集ページを開けたことを証明する
    expect(page).to have_css "h1", text: "編集"
    # 編集する
    fill_in "book_author", with: "名無し"
    click_button "更新する"
    # 編集できたことを証明する
    expect(page).to have_content "更新完了"
  end

  scenario "ログインしたユーザーは本の情報を削除できる" do
    # 削除する
    click_link "削除"
    # 削除できたことをを証明する
    expect(page).to have_content "削除完了"
  end
end
