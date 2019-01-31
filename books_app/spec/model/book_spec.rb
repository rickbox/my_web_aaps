# frozen_string_literal: true

require "rails_helper"

describe Book do
  it "bookが作成可能であること" do
    book = Book.new(
      title: "hoge",
      memo: "hogehoge",
      author: "rickbox"
    )
    expect(book).to be_valid
  end
end
