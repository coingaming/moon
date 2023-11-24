defmodule Moon.Parts.Header.LeftButton do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Button.IconButton

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Rendered HTML element"
  prop(as, :string, values!: ~w(a button), default: "button")
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "On click event"
  prop(on_click, :event)
  @doc "Icon name"
  prop(icon, :string)
  @doc "Href"
  prop(href, :string)
  @doc "Disabled"
  prop(disabled, :boolean, default: false)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <IconButton
      {=@id}
      {=@testid}
      {=@as}
      class={merge([
        "bg-goku text-bulma border border-beerus rounded-full h-12 w-12 lg:hidden absolute top-0 start-0 rtl:rotate-180",
        [hidden: @is_hidden],
        @class
      ])}
      {=@href}
      icon={@icon || "controls_chevron_left_small"}
      {=@on_click}
      {=@disabled}
    />
    """
  end
end
