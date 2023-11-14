defmodule Moon.Parts.Button.ButtonsBlock do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Additional Tailwind classes for external container"
  prop(class, :css_class)
  @doc "Additional Tailwind classes for internal container"
  prop(testid, :string)
  @doc "If true, adds a divider"
  prop(has_divider, :boolean, default: false)
  @doc "Additional buttons etc."
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        ["w-full flex justify-end gap-2 pt-8", "border-t border-beerus": @has_divider],
        @class
      ])}
    >
      <#slot />
    </div>
    """
  end
end
