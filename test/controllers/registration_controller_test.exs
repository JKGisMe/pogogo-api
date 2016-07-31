defmodule Pogogo.RegistrationControllerTest do
  use Pogogo.ConnCase

  alias Pogogo.User

  @valid_attrs %{
    email: "stuff@things.com",
    password: "passw0rd",
    password_confirmation: "passw0rd"
  }

  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders rss when data is valid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), %{data: %{type: "user",
      attributes: @valid_attrs
    }}


    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(User, %{email: @valid_attrs[:email]})
  end

  test "does not create rss and renders errors when data is invalid", %{conn: conn} do
    assert_error_sent 400, fn ->
      conn = post conn, registration_path(conn, :create), %{data: %{type: "user",
        attributes: @invalid_attrs
      }}
    end
  end

end