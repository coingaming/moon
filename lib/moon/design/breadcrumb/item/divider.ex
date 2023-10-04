defmodule Moon.Design.Breadcrumb.Item.Divider do
  @moduledoc false

  use Moon.StatelessComponent, slot: "divider_slot"

  alias Moon.Icon

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  prop(value, :integer, from_context: :value)
  prop(divider, :string)

  def render(assigns) do
    ~F"""
    <Icon
      name={@divider || "arrows_right"}
      class={merge(["rtl:rotate-180 mx-2 text-moon-14 text-trunks", @class])}
      :if={@value != 0}
    />
    """
  end
end
