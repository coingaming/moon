defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm.User

  schema "users" do
    field(:name)
    field(:email)
    field(:gender)
  end

  def changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :gender])
    |> validate_required([:name, :email, :gender])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male"])
  end
end
