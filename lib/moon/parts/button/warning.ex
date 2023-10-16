defmodule Moon.Parts.Button.Warning do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Button

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
  @doc "Full width button"
  prop(full_width, :boolean)
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
  @doc "Left icon"
  prop(left_icon, :string)
  @doc "Right icon"
  prop(right_icon, :string)
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
  @doc "Right icon slot"
  slot(right_icon_slot)
  @doc "Left icon slot"
  slot(left_icon_slot)

  def render(assigns) do
    ~F"""
    <Button
      {=@as}
      {=@variant}
      {=@size}
      {=@full_width}
      {=@disabled}
      {=@animation}
      {=@type}
      {=@form}
      {=@hover_bg_class}
      {=@left_icon}
      {=@right_icon}
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
      class={"rounded-moon-s-xx rounded-full bg-piccolcox bg-krillin-10 text-krillin", @class}
    >
      <#slot {@left_icon_slot} />
      <#slot />
      <#slot {@right_icon_slot} />
    </Button>
    """
  end
end
