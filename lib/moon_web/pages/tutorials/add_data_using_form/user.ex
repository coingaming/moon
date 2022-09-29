defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @required_fields ~w(name email gender username password)a
  @optional_fields ~w(document_filename agrees_to_marketing_emails agrees_to_terms_of_service permissions role phone country)a

  schema "users" do
    field(:username, :string, default: "johndoe")
    field(:password, :string, default: "verysecret123")
    field(:name, :string, default: "First Last")
    field(:email, :string, default: "joe@doe.com")
    field(:phone, :string)
    field(:country, :string)
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

  def available_permissions_with_left_icon() do
    [
      %{value: 1, label: "Read", left_icon: [Moon.Icon, %{name: "generic_user"}]},
      %{value: 2, label: "Write", left_icon: [Moon.Icon, %{name: "generic_star"}]},
      %{value: 3, label: "Update", left_icon: [Moon.Icon, %{name: "text_increase_indent"}]},
      %{value: 4, label: "Delete", left_icon: [Moon.Icon, %{name: "generic_edit"}]},
      %{value: 5, label: "Nuclear war", left_icon: [Moon.Icon, %{name: "files_file"}]}
    ]
  end

  def available_roles() do
    [
      %{value: 1, label: "User"},
      %{value: 2, label: "Editor"},
      %{value: 3, label: "Admin"}
    ]
  end

  def available_roles_with_left_icon() do
    [
      %{value: 1, label: "User", left_icon: [Moon.Icon, %{name: "generic_user"}]},
      %{value: 2, label: "Editor", left_icon: [Moon.Icon, %{name: "generic_edit"}]},
      %{value: 3, label: "Admin", left_icon: [Moon.Icon, %{name: "generic_star"}]}
    ]
  end

  def available_roles_with_right_icon() do
    [
      %{value: 1, label: "User", right_icon: [Moon.Icon, %{name: "generic_user"}]},
      %{value: 2, label: "Editor", right_icon: [Moon.Icon, %{name: "generic_edit"}]},
      %{value: 3, label: "Admin", right_icon: [Moon.Icon, %{name: "generic_star"}]}
    ]
  end

  def available_roles_with_left_icon_flag() do
    [first, second, third] = Moon.Helpers.CountryFlags.list_all() |> Enum.take(3)

    [
      %{value: 1, label: "User", left_icon: [Moon.CountryFlag, %{name: first}]},
      %{value: 2, label: "Editor", left_icon: [Moon.CountryFlag, %{name: second}]},
      %{value: 3, label: "Admin", left_icon: [Moon.CountryFlag, %{name: third}]}
    ]
  end

  def available_roles_with_left_icon_flag_and_right_icon() do
    [first, second, third] = Moon.Helpers.CountryFlags.list_all() |> Enum.take(3)

    [
      %{
        value: 1,
        label: "User",
        left_icon: [Moon.CountryFlag, %{name: first}],
        right_icon: [Moon.Icon, %{name: "generic_user"}]
      },
      %{
        value: 2,
        label: "Editor",
        left_icon: [Moon.CountryFlag, %{name: second}],
        right_icon: [Moon.Icon, %{name: "generic_edit"}]
      },
      %{
        value: 3,
        label: "Admin",
        left_icon: [Moon.CountryFlag, %{name: third}],
        right_icon: [Moon.Icon, %{name: "generic_star"}]
      }
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
