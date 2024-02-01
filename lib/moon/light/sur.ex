defmodule Moon.Light.Sur do
  @moduledoc false
  defmodule Event do
    @moduledoc false
    defstruct [:name, :target]

    def from(e = %__MODULE__{}), do: e
    def from(e = %Phoenix.LiveView.JS{}), do: %__MODULE__{name: e, target: nil}
    def from(nil), do: %__MODULE__{name: nil, target: nil}

    def find_target(events) do
      event = events |> Enum.find(&(!!&1))
      event && event.target
    end
  end

  def data_values(list \\ []) do
    Enum.map(list, fn {k, v} -> {:"phx-value-#{k}", v} end)
  end

  def has_slot?([]), do: false
  def has_slot?(smth), do: !!smth
end
