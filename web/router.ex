defmodule Pogogo.Router do
  use Pogogo.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Pogogo do
    pipe_through :api

    # Route stuff to our SessionController
    resources "session", SessionController, only: [:index]
  end
end
