defmodule Pogogo.RegistrationController do
  use Pogogo.Web, :controller

  alias Pogogo.User

  def create(conn, %{"data" => %{"type" => "users",
    "attributes" => %{"email" => email,
      "password" => password,
      "password-confirmation" => password_confirmation}}}) do

    changeset = User.changeset %User{}, %{email: email,
      password_confirmation: password_confirmation,
      password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Pogogo.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pogogo.ChangesetView, "error.json", changeset: changeset)
    end
  end

end