defmodule Moon.Parts.Header.Buttons do
  @moduledoc false

  use Moon.StatelessComponent, slot: "buttons"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(title_only, :boolean, from_context: :title_only)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        "md:gap-2 flex md:justify-end absolute md:top-8 md:end-8 start-4 end-4 top-4",
        ["md:top-5": @title_only, "md:hidden": @is_hidden],
        @class
      ])}
    >
      <#slot />
    </div>
    """
  end
end
