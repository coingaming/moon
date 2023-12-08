defmodule Moon.Parts.Header.ButtonGroupLink do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Tooltip

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Rendered HTML element"
  prop(as, :string, values!: ~w(a button), default: "button")
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(trigger_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(button_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(tooltip_class, :css_class)
  @doc "Tooltip text"
  prop(tooltip_text, :string, default: "")
  @doc "Route to redirect to"
  prop(route, :any)
  @doc "Icon name"
  prop(icon, :string)
  @doc "On click event"
  prop(on_click, :event)
  @doc "Href"
  prop(href, :string)
  @doc "Disabled"
  prop(disabled, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Tooltip {=@id} {=@testid} class={merge(["self-center", @class])}>
      <Tooltip.Trigger class={merge(["rounded-full h-12 w-12", @trigger_class])}>
        <IconButton
          {=@as}
          class={merge([
            "bg-goku text-bulma border border-beerus rounded-full h-12 w-12 md:inline hidden",
            @button_class
          ])}
          {=@on_click}
          {=@href}
          {=@icon}
          {=@disabled}
        />
      </Tooltip.Trigger>
      <Tooltip.Content
        position="bottom"
        class={merge(["bg-bulma text-goku z-[19999]", @tooltip_class])}
      >{@tooltip_text}<Tooltip.Arrow class="mt-1" />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
