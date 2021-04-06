defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  schema "users" do
    field(:name)
    field(:email)
    field(:gender)
    field(:document_filename)
  end

  def changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :gender, :document_filename])
    |> validate_required([:name, :email, :gender, :document_filename])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])
  end
end
