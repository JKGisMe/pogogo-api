defmodule Pogogo.AuthErrorHandler do
  use Pogogo.Web, :controller

  def unauthenticated(conn, params) do
    conn
      |> put_status(401)
      |> render(Pogogo.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
      |> put_status(403)
      |> render(Pogogo.ErrorView, "403.json")
  end
end