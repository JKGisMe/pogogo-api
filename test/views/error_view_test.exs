defmodule Pogogo.ErrorViewTest do
  use Pogogo.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Pogogo.ErrorView, "404.json", []) ==
           %{errors: [%{code: 404, title: "Page Not Found"}]}
  end

  test "render 500.json" do
    assert render(Pogogo.ErrorView, "500.json", []) ==
           %{errors: [%{title: "Internal Server Error", code: 500}]}
  end

  test "render any other" do
    assert render(Pogogo.ErrorView, "500.json", []) ==
           %{errors: [%{title: "Internal Server Error", code: 500}]}
  end
end
