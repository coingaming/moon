defmodule Moon.Parts.Header.RightButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "right_button"

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

  def render(assigns) do
    ~F"""
    <IconButton
      {=@id}
      {=@testid}
      {=@as}
      class={merge([
        "bg-goku text-bulma rounded-moon-s-xx border border-beerus rounded-full h-12 w-12 lg:hidden",
        @class
      ])}
      {=@href}
      icon={@icon || "other3_dots"}
      {=@on_click}
      {=@disabled}
    />
    """
  end
end
