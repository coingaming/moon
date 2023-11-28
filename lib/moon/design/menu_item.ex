defmodule Moon.Design.MenuItem do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Lego

  @doc "Attribute data-testid for the tag"
  prop(testid, :string)
  @doc "An id attribute for the slot"
  prop(id, :string)
  @doc "Any additional CSS classes for the DOM element"
  prop(class, :css_class)
  @doc "Some title. If no default slot given - will add Lego.Title with this title"
  prop(title, :string)
  @doc "Some text. If no default slot given - will add Lego.MultiTitle with this text and title"
  prop(text, :string)
  @doc "Some additional classes will be added to indicate is active"
  prop(is_active, :boolean, default: false)
  @doc "Add this as is_selected value and also work for underlying checkbox/radio"
  prop(is_selected, :boolean, default: false)
  @doc "Well, on-click event handler"
  prop(on_click, :event)
  @doc "Wenever add Checbox/Switch/Radio inside when no default slot is given"
  prop(role, :string, values: ~w(checkbox switch radio))
  @doc "CSS class for width"
  prop(width, :css_class, default: "w-full")
  @doc "Which tag should be set for rendering"
  prop(as, :string, values!: ~w(a button div), default: "button")
  @doc "A href attribute when prop as=\"a\""
  prop(href, :string)
  @doc "Additional attributes set for the tag"
  prop(attrs, :map, default: %{})
  @doc "Value atrribute if needs to be assigned"
  prop(value, :integer)
  @doc "Size of menu item"
  prop(size, :string, values: ["md", "lg", "xl"], default: "md")
  @doc "Inner content of the component, some properties are ignored when set - see above"
  slot(default)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@id}
      {=@as}
      {=@href}
      {=@role}
      {=@value}
      class={merge([
        [
          "flex justify-between items-center bg-transparent rounded-moon-i-sm text-moon-14",
          "focus:outline-none focus:shadow-focus cursor-pointer hover:bg-heles transition",
          @width,
          "bg-heles": @is_active || @is_selected,
          "p-2 gap-2": @size == "md",
          "p-3 gap-3": @size == "lg",
          "p-4 gap-4": @size == "xl"
        ],
        @class
      ])}
      {=@attrs}
      on_click={@on_click}
      values={is_selected: !@is_selected}
      testid={@testid}
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
