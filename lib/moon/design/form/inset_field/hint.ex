defmodule Moon.Design.Form.InsetField.Hint do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(title, :string)
  prop(disabled, :boolean, from_context: :disabled)

  slot(default)

  def render(assigns) do
    ~F"""
    <div class={merge([
      [
        "inline-block mt-2 ps-4 text-moon-12 text-trunks",
        "opacity-60 cursor-not-allowed": @disabled
      ],
      @class
    ])}>
      <#slot><p>{@title}</p></#slot>
    </div>
    """
  end
end
