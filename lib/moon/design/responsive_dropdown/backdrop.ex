defmodule Moon.Design.ResponsiveDropdown.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  """
  prop(as_dropdown_on, :string, values: ~w(sm md lg xl 2xl), from_context: :as_dropdown_on)

  @doc "If the optionlist is open, got from context"
  prop(is_open, :boolean, from_context: :is_open)

  def render(assigns) do
    ~F"""
    <div
      :if={@as_dropdown_on}
      {=@id}
      class={merge([
        "fixed inset-0 bg-zeno z-[99999]",
        "moon-backdrop",
        backdrop_classes(@as_dropdown_on),
        hidden: !@is_open
      ])}
      data-testid={@testid}
    />
    """
  end

  defp backdrop_classes(nil), do: []

  defp backdrop_classes(size) do
    ~w(hidden)
    |> Enum.map(&"#{size}:#{&1}")
  end
end
