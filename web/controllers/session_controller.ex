
defmodule Pogogo.SessionController do
  use Pogogo.Web, :controller

  import Ecto.Query, only: [where: 2]
  import Comeonin.Bcrypt
  import Logger

  alias Pogogo.User

  def create(conn, %{"grant_type" => "password",
    "username" => username,
    "password" => password}) do

    try do
      # Retrieve user from DB by email address
      user = User
      |> where(email: ^username)
      |> Repo.one!

      cond do
        checkpw(password, user.password_hash) ->

          # on successful login
          Logger.info "User " <> username <> " just logged in"

          # encode JWT
          {:ok, jwt, _} = Guardian.encode_and_sign(user, :token)
          conn
          |> json(%{access_token: jwt}) # return token

          true ->

          # failed login
          Logger.warning "User " <> username <> " failed to login"
          conn
          |> put_status(401)
          |> render(Pogogo.ErrorView, "401.json")
      end
    rescue
      e ->
        IO.inspect e # prints error to console
        Logger.error "Unexpected error while attempting login user: " <> username

        conn
        |> put_status(401)
        |> render(Pogogo.ErrorView, "401.json")
    end
  end

  def create(conn, %{"grant_type" => _}) do

    # unknown grant type
    throw "Weird ass grant type"
  end
end