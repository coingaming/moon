defmodule Moon.Design.Form.Textarea do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Form.TextArea

  slot(default)

  prop(class, :css_class)
  @doc "attributes directly passed to textarea html tag. see Surface.Components.Form.TextArea"
  prop(attrs, :map, default: %{})

  prop(rows, :string)
  prop(cols, :string)
  prop(disabled, :boolean, default: false)
  prop(placeholder, :string, default: "")
  prop(error, :boolean, from_context: :error)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <TextArea
      class={merge([
        "appearance-none resize-none w-full p-4 text-moon-16 text-bulma bg-gohan border-0",
        "rounded-moon-s-sm placeholder:text-trunks transition-shadow",
        "before:box-border after:box-border",
        "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
        "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
        "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        @disabled && "opacity-30 cursor-not-allowed",
        @class
      ])}
      {=@rows}
      {=@id}
      {=@cols}
      opts={Map.merge(@attrs, %{
        disabled: @disabled,
        placeholder: @placeholder,
        "data-testid": @testid,
        error: @error
      })}
    />
    """
  end
end
