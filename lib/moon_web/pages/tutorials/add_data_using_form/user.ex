defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @required_fields ~w(name email gender)a
  @optional_fields ~w(document_filename)a

  schema "users" do
    field(:name)
    field(:email)
    field(:gender)
    field(:document_filename)
  end

  def changeset(user = %User{}, params \\ %{}) do
    user_changeset = user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])

    Map.merge(user_changeset, %{action: :insert})
  end
end
