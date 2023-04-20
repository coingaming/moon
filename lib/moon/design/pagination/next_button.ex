defmodule Moon.Design.Pagination.NextButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "next_button"

  alias Moon.Design.Button

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Additional Tailwind classes for hover background"
  prop(hover_bg_class, :css_class)

  @doc "Visual/Logical variant of button"
  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "secondary"
  )

  @doc "Size of button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "sm")

  @doc "Inner content of the component"
  slot(default)

  # inner API
  @doc "Will be got from Pagination in most cases"
  prop(on_change, :event, from_context: :on_change)

  @doc "Will be got from Pagination in most cases"
  prop(value, :integer, from_context: :value)

  @doc "Will be got from Pagination in most cases"
  prop(disabled, :boolean, from_context: :disabled)

  def render(assigns) do
    ~F"""
    <Button
      {=@id}
      class={merge(["px-1", @class])}
      {=@hover_bg_class}
      {=@value}
      {=@variant}
      {=@size}
      {=@disabled}
      {=@testid}
      on_click={@on_change}
    >
      <#slot />
    </Button>
    """
  end
end
