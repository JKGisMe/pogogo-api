defmodule Pogogo.UserTest do
  use Pogogo.ModelCase

  alias Pogogo.User

  @valid_attrs %{email: "stuff@things.com", password: "passw0rd", password_confirmation: "passw0rd"}
  @invalid_attrs %{email: "stuff&things.com", password: "pass", password_confirmation: "pass"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mismatched passwords rejected" do
    changeset = User.changeset(%User{},
      %{email: "stuff@things.com", password: "passw0rd", password_confirmation: "password"})
    refute changeset.valid?
  end

  test "missing password confirmation rejected" do
    changeset = User.changeset(%User{},
      %{email: "stuff@things.com", password: "passw0rd"})
    refute changeset.valid?
  end

  test "missing email address rejected" do
    changeset = User.changeset(%User{},
      %{password: "passw0rd", password_confirmation: "passw0rd"})
    refute changeset.valid?
  end

  test "missing password rejected" do
    changeset = User.changeset(%User{},
      %{email: "stuff@things.com", password_confirmation: "passw0rd"})
    refute changeset.valid?
  end
end
