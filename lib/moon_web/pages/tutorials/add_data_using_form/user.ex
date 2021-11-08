defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @required_fields ~w(name email gender)a
  @optional_fields ~w(document_filename)a

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:gender, :string)
    field(:document_filename, :string)
  end

  def changeset(user = %User{}, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])
  end
end
