defmodule Moon.Components.MenuItem do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias __MODULE__

  prop(title, :string, required: true)
  prop(text, :string)

  prop(is_active, :boolean, default: false)

  prop(is_selected, :boolean, default: false)
  prop(on_click, :event)
  prop(role, :string, values: ~w(checkbox switch radio))

  prop(width, :css_class, default: "w-full")
  prop(class, :css_class)

  prop(as, :string, values!: ~w(a button), default: "button")
  prop(href, :string)
  prop(attrs, :map, default: %{})

  slot(default)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@role}
      {=@attrs}
      class={
        "flex gap-2 justify-between items-center p-2 bg-transparent rounded-moon-i-sm text-moon-14",
        "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-bulma-100/[0.04] transition",
        @width,
        @class,
        "bg-bulma-100/[0.04]": @is_active || @is_selected
      }
      on_click={@on_click}
      values={is_selected: !@is_selected}
    >
      <#slot context_put={__MODULE__, is_selected: @is_selected}>
        <MenuItem.Title {=@title} :if={@title && !@text} />
        <MenuItem.MultiTitle {=@title} {=@text} :if={@text} />
        <MenuItem.Checkbox :if={@role == "checkbox"} />
        <MenuItem.Radio :if={@role == "radio"} />
        <MenuItem.Switch :if={@role == "switch"} />
      </#slot>
    </AsComponent>
    """
  end
end
