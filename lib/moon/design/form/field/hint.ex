defmodule Moon.Design.Form.Field.Hint do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(title, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "inline-block mt-2 ps-4 text-moon-12 text-trunks",
      @class
    ])}>
      <#slot><p>{@title}</p></#slot>
    </div>
    """
  end
end
