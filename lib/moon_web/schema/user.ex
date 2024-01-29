defmodule MoonWeb.Schema.User do
  @moduledoc "Ecto schema for stub User. Initiated as a copy of MoonWeb.Pages.Tutorials.AddDataUsingForm.User"

  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name email gender username password authentication)a
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
    field(:permissions, {:array, :integer})
    field(:role, :integer)
    field(:authentication, :string)
  end

  def gender_options() do
    [
      %{key: "Female", value: "female"},
      %{key: "Male", value: "male"},
      %{key: "Invalid choice", value: "invalid"},
      %{key: "I identify as God and this is not important", value: "god", disabled: true}
    ]
  end

  def available_permissions() do
    [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true}
    ]
  end

  def available_permissions_with_left_icon() do
    [
      %{value: 1, key: "Read", left_icon: [Moon.Icon, %{name: "generic_user"}]},
      %{value: 2, key: "Write", left_icon: [Moon.Icon, %{name: "generic_star"}]},
      %{value: 3, key: "Update", left_icon: [Moon.Icon, %{name: "text_increase_indent"}]},
      %{value: 4, key: "Delete", left_icon: [Moon.Icon, %{name: "generic_edit"}]},
      %{value: 5, key: "Nuclear war", left_icon: [Moon.Icon, %{name: "files_file"}]}
    ]
  end

  def available_roles() do
    [
      %{value: 1, key: "User"},
      %{value: 2, key: "Editor"},
      %{value: 3, key: "Admin"}
    ]
  end

  def available_roles_with_icon() do
    [
      %{value: 1, key: "User", icon: "generic_user"},
      %{value: 2, key: "Editor", icon: "generic_edit"},
      %{value: 3, key: "Admin", icon: "generic_star"}
    ]
  end

  def available_roles_with_right_icon() do
    [
      %{value: 1, key: "User", right_icon: [Moon.Icon, %{name: "generic_user"}]},
      %{value: 2, key: "Editor", right_icon: [Moon.Icon, %{name: "generic_edit"}]},
      %{value: 3, key: "Admin", right_icon: [Moon.Icon, %{name: "generic_star"}]}
    ]
  end

  def available_roles_with_left_icon_flag() do
    [first, second, third | _] = Moon.Helpers.CountryFlags.list_all()

    [
      %{value: 1, key: "User", left_icon: [Moon.CountryFlag, %{name: first}]},
      %{value: 2, key: "Editor", left_icon: [Moon.CountryFlag, %{name: second}]},
      %{value: 3, key: "Admin", left_icon: [Moon.CountryFlag, %{name: third}]}
    ]
  end

  def available_roles_with_left_icon_flag_and_right_icon() do
    [first, second, third] = Moon.Helpers.CountryFlags.list_all() |> Enum.take(3)

    [
      %{
        value: 1,
        key: "User",
        left_icon: [Moon.CountryFlag, %{name: first}],
        right_icon: [Moon.Icon, %{name: "generic_user"}]
      },
      %{
        value: 2,
        key: "Editor",
        left_icon: [Moon.CountryFlag, %{name: second}],
        right_icon: [Moon.Icon, %{name: "generic_edit"}]
      },
      %{
        value: 3,
        key: "Admin",
        left_icon: [Moon.CountryFlag, %{name: third}],
        right_icon: [Moon.Icon, %{name: "generic_star"}]
      }
    ]
  end

  def changeset(user = %__MODULE__{}, params) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 4)
    |> validate_length(:authentication, min: 4)
    |> validate_inclusion(:password, ["password"],
      message: "sorry, correct password is 'verysecret123'"
    )
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:gender, ["female", "male", "other"])
    |> validate_inclusion(:agrees_to_terms_of_service, [true],
      message: "please accept terms of service"
    )
  end

  def changeset(user = %__MODULE__{}) do
    cast(user, %{}, @required_fields ++ @optional_fields)
  end
end
