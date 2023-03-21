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

  def render(assigns) do
    ~F"""
      <TextArea
        class={merge([
          "appearance-none resize-none w-full p-4 text-moon-16 text-bulma bg-gohan border-0",
          "rounded-moon-s-sm placeholder:text-trunks transition-shadow",
          "before:box-border after:box-border",
          "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
          @disabled && "opacity-30 cursor-not-allowed",
          @class
        ])}
        {=@rows}
        {=@cols}
        opts={Map.merge(@attrs, %{disabled: @disabled, placeholder: @placeholder})}
      />
    """
  end
end
