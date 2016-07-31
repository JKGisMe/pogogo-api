defmodule Pogogo.ChangesetView do
  use Pogogo.Web, :view

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changset.traverse_errors/2` and
  `Pogogo.ErrorHelpers.translate_error/1` for more details.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    JaSerializer.EctoErrorSerializer.format(changeset)
  end
end