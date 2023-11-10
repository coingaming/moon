defmodule Moon.Design.Form.AuthCode.Hint do
  @moduledoc false

  use Moon.StatelessComponent, slot: "hint"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Hint text when default slot is not given"
  prop(title, :string)
  @doc "Content of hint message"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "flex gap-1 items-center mt-2 text-moon-12 [&_svg]:text-moon-16",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot><p>{@title}</p></#slot>
    </div>
    """
  end
end
