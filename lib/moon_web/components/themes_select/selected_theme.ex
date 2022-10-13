defmodule MoonWeb.Components.ThemesSelect.SelectedTheme do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Components.ThemesSelect.SelectedTheme

  @optional_fields ~w(is_dark)a

  schema "selected_themes" do
    field(:is_dark, :boolean, default: false)
  end

  def changeset(selected_theme = %SelectedTheme{}, params \\ %{}) do
    cast(selected_theme, params, @optional_fields)
  end
end
