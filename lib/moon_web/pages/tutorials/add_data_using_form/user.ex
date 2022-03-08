defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @required_fields ~w(name email gender username password)a
  @optional_fields ~w(document_filename agrees_to_marketing_emails agrees_to_terms_of_service permissions role)a

  schema "users" do
    field(:username, :string, default: "johndoe")
    field(:password, :string, default: "verysecret123")
    field(:name, :string, default: "First Last")
    field(:email, :string, default: "joe@doe.com")
    field(:gender, :string, default: "male")
    field(:document_filename)
    field(:agrees_to_terms_of_service, :boolean, default: true)
    field(:agrees_to_marketing_emails, :boolean, default: true)
    field(:permissions, {:array, :integer}, default: [1, 2])
    field(:role, :integer, default: nil)
  end

  def available_permissions() do
    [
      %{value: 1, label: "Read"},
      %{value: 2, label: "Write"},
      %{value: 3, label: "Update"},
      %{value: 4, label: "Delete"},
      %{value: 5, label: "Nuclear war"}
    ]
  end

  def available_roles() do
    [
      %{value: 1, label: "User"},
      %{value: 2, label: "Editor"},
      %{value: 3, label: "Admin"}
    ]
  end

  def changeset(user = %User{}, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 4)
    |> validate_inclusion(:password, ["password"],
      message: "sorry, correct password is 'verysecret123'"
    )
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])
    |> validate_inclusion(:agrees_to_terms_of_service, [true],
      message: "please accept terms of service"
    )
  end
end
