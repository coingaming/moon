defmodule Moon.Parts.IconButton do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Button.IconButton

  @doc "Visual/Logical variant of button"
  prop(variant, :string,
    values: ["fill", "outline", "ghost"],
    default: "fill"
  )

  @doc "Size of button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  @doc "Rendered HTML element"
  prop(as, :string, values!: ~w(a button), default: "button")
  @doc "A href attribute when prop as=\"a\""
  prop(href, :string)
  @doc "Disabled button"
  prop(disabled, :boolean)
  @doc "Animation of button"
  prop(animation, :string, values: ~w(progress success error pulse))
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes for hover background"
  prop(hover_bg_class, :css_class)
  @doc "Type attribute for DOM element"
  prop(type, :string, default: "button")
  @doc "Form attribute for DOM element"
  prop(form, :string)
  @doc "On click event"
  prop(on_click, :event)
  @doc "list of additional values to associate with the DOM element"
  prop(values, :keyword, default: [])
  @doc "Value attribute for DOM element"
  prop(value, :string)
  @doc "Icon"
  prop(icon, :string)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional attributes for DOM element"
  prop(attrs, :keyword, default: [])
  @doc "Aria label attribute for DOM element"
  prop(aria_label, :string)
  @doc "Target attribute for DOM element"
  prop(target, :string)
  @doc "Rel attribute for DOM element"
  prop(rel, :string)
  @doc "Inner content of the component"
  slot(default)

  def render(assigns) do
    ~F"""
    <IconButton
      {=@as}
      {=@variant}
      {=@size}
      {=@disabled}
      {=@animation}
      {=@icon}
      {=@type}
      {=@form}
      {=@hover_bg_class}
      {=@href}
      {=@id}
      {=@on_click}
      {=@testid}
      {=@aria_label}
      {=@values}
      {=@value}
      {=@target}
      {=@rel}
      {=@attrs}
      class={"rounded-moon-s-xx rounded-full bg-popo", @class}
    >
      <#slot />
    </IconButton>
    """
  end
end
