require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
        family_name: "Yamada",
        first_name: "Taro",
        email: "user@example.com",
        student_number: "101730101",
        phone: "09011112222",
        password: "SamplePassword",
        password_confirmation: "SamplePassword"
    )
  end

  test "アカウント情報が正しいか" do
    assert @user.valid?
  end

  test "ユーザーの姓が空白である" do
    @user.family_name = "     "
    assert_not @user.valid?
  end

  test "ユーザーの姓が長すぎる" do
    @user.family_name = "a" * 26
    assert_not @user.valid?
  end

  test "ユーザーの名が空白である" do
    @user.first_name = "     "
    assert_not @user.valid?
  end

  test "ユーザーの名が長すぎる" do
    @user.first_name = "a" * 26
    assert_not @user.valid?
  end

  test "Eメールが空白である" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "Eメールが長すぎる" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "Eメールが正しい形式ではない" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} が正しくないはずです"
    end
  end

  test "Eメールは一意でなければならない" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "Eメールは大文字小文字を区別しない" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "パスワードは空白ではならない" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "パスワードは短すぎてはいけない" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
