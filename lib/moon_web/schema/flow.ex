defmodule MoonWeb.Schema.Flow do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  @required_fields [:flow_name, :merchant_name, :provider_name]

  embedded_schema do
    field(:flow_name, :string)
    field(:merchant_name, :string)
    field(:provider_name, :string)
    field(:verification_types, {:array, :string})
  end

  def changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  def changeset(form, params) do
    form
    |> cast(params, @required_fields)
  end
end
