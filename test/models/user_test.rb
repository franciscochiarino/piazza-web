require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "requires name" do
    @user = User.new(
      name: "",
      email: "johndoe@example.com",
      password: "password"
    )
    assert_not(@user.valid?)

    @user.name = "John"
    assert(@user.valid?)
  end

  test "requires a valid email" do
    @user = User.new(
      name: "John",
      email: "",
      password: "password"
    )
    assert_not(@user.valid?)

    @user.email = "invalid"
    assert_not(@user.valid?)

    @user.email = "johndoe@example.com"
    assert(@user.valid?)
  end

  test "requires a unique email" do
    @existing_user = User.create(
      name: "John",
      email: "jd@example.com",
      password: "password"
    )
    assert(@existing_user.persisted?)

    @user = User.new(
      name: "Jon",
      email: "jd@example.com",
      password: "password"
    )
    assert_not(@user.valid?)
  end

  test "name and email is stripped of spaces before saving" do
    @user = User.create(
      name: " John ",
      email: " johndoe@example.com ",
      password: "password"
    )

    assert_equal("John", @user.name)
    assert_equal("johndoe@example.com", @user.email)
  end

  test "name and email can be updated" do
    @user = User.create(
      name: "Joe",
      email: "joe@example.com",
      password: "password"
    )
    @user.update(
      name: "Bob",
      email: "bob@example.com"
    )

    assert_equal("Bob", @user.name)
    assert_equal("bob@example.com", @user.email)
  end

  test "password can be updated" do
    # TODO: test updating a user with and without the :password_change context
  end
end
