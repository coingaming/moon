defmodule Moon.Design.MenuItem do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Components.Lego

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
        "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-heles transition",
        @width,
        @class,
        "bg-heles": @is_active || @is_selected
      }
      on_click={@on_click}
      values={is_selected: !@is_selected}
    >
      <#slot context_put={is_selected: @is_selected}>
        <Lego.Title {=@title} :if={@title && !@text} />
        <Lego.MultiTitle {=@title} {=@text} :if={@text} />
        <Lego.Checkbox :if={@role == "checkbox"} {=@is_selected} />
        <Lego.Radio :if={@role == "radio"} {=@is_selected} />
        <Lego.ChevronUpDown :if={@role == "switch"} {=@is_selected} />
      </#slot>
    </AsComponent>
    """
  end
end
