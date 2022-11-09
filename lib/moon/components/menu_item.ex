defmodule Moon.Components.MenuItem do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Components.MenuItem, as: MI

  prop(title, :string, required: true)
  prop(text, :string)

  prop(is_active, :boolean, default: false)
  prop(is_selected, :boolean, default: false)
  prop(is_checkbox, :boolean, default: false)
  prop(is_radio, :boolean, default: false)
  prop(width, :css_class, default: "w-full")

  prop(as, :atom, values!: [:a, :button], default: :button)
  prop(href, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      class={
        "flex gap-2 justify-between items-center p-2 bg-transparent rounded-moon-i-sm text-moon-14",
        "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-bulma-100/[0.04] transition",
        @width,
        "bg-bulma-100/[0.04]": @is_active || @is_selected
      }
    >
      <#slot>
        <MI.Title {=@title} :if={@title && !@text} />
        <MI.MultiTitle {=@title} {=@text} :if={@text} />
        <MI.Checkbox {=@is_selected} :if={@is_checkbox} />
        <MI.Radio {=@is_selected} :if={!@is_checkbox && @is_radio} />
      </#slot>
    </AsComponent>
    """
  end
end
