defmodule Moon.Design.Form.InsetField.Hint do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Whether error icon is shown"
  prop(has_error_icon, :boolean, default: false)
  @doc "Hint text when default slot is not given"
  prop(title, :string)
  @doc "Disabled state, usually got from context"
  prop(disabled, :boolean, from_context: :disabled)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      {=@id}
      class={merge([
        [
          "flex gap-1 items-center mt-2 text-moon-12 [&_svg]:text-moon-16 text-trunks",
          "opacity-60 cursor-not-allowed": @disabled
        ],
        @class
      ])}
    >
      <#slot><p>{@title}</p></#slot>
    </div>
    """
  end
end
