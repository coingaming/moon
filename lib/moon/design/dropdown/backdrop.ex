defmodule Moon.Design.Dropdown.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  alias Moon.Design.Modal.Backdrop

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  """
  prop(as_dropdown_on, :string, values: ~w(sm md lg xl 2xl), from_context: :as_dropdown_on)

  @doc "If the optionlist is open, got from context"
  prop(is_open, :boolean, from_context: :is_open)

  def render(assigns) do
    ~F"""
    <Backdrop
      {=@id}
      :if={@as_dropdown_on}
      class={merge(["z-[99999]", @as_dropdown_on && "#{@as_dropdown_on}:hidden", @class, hidden: !@is_open])}
      testid={@testid}
    />
    """
  end
end
