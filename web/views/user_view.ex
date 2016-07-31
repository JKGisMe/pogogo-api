defmodule Pogogo.UserView do
  use Pogogo.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Pogogo.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Pogogo.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
    	"type": "user",
    	"id": user.id,
    	"attributes": %{
    		"email": user.email
    	}
    }
  end
end