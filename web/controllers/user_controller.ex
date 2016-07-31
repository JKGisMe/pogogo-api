defmodule Pogogo.UserController do
  use Pogogo.Web, :controller

  alias Pogogo.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Pogogo.AuthErrorHandler

  def current(conn, _) do
    user = conn
      |> Guardian.Plug.current_resource

    conn
      |> render(Pogogo.UserView, "show.json", user: user)
  end
end