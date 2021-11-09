defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @required_fields ~w(name email gender)a
  @optional_fields ~w(document_filename agrees_to_marketing_emails)a

  schema "users" do
    field(:name)
    field(:email)
    field(:gender)
    field(:document_filename)
    field(:agrees_to_marketing_emails, :boolean)
  end

  def changeset(user = %User{}, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])
  end
end
