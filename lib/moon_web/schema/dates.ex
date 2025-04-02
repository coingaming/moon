defmodule MoonWeb.Schema.Dates do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  use Gettext, backend: MoonWeb.Gettext

  embedded_schema do
    field(:date_from, :date)
    field(:date_to, :date)
  end

  @required_params ~w(date_from date_to)a

  def create_changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params, message: gettext("can't be blank"))
    |> validate_range()
  end

  defp validate_range(changeset) do
    date_from = get_field(changeset, :date_from)
    date_to = get_field(changeset, :date_to)

    cond do
      is_nil(date_from) or is_nil(date_to) ->
        changeset

      Timex.compare(date_from, date_to) == 1 ->
        add_error(
          changeset,
          :date_to,
          gettext("lower bound must be less than upper bound or equal")
        )

      true ->
        changeset
    end
  end
end
