defmodule Moon.Design.Form.AuthCode.Hint do
  @moduledoc false

  use Moon.StatelessComponent, slot: "hint"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Content of hint message"
  slot(default)

  def render(assigns) do
    ~F"""
    <p
      {=@id}
      class={merge([
        [
          "inline-block mt-2 text-moon-12 text-trunks"
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <#slot />
    </p>
    """
  end
end
