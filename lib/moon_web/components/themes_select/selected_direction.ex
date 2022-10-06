defmodule MoonWeb.Components.ThemesSelect.SelectedDirection do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Components.ThemesSelect.SelectedDirection

  @optional_fields ~w(is_rtl)a

  schema "selected_direction" do
    field(:is_rtl, :boolean, default: false)
  end

  def changeset(selected_direction = %SelectedDirection{}, params \\ %{}) do
    cast(selected_direction, params, @optional_fields)
  end
end
