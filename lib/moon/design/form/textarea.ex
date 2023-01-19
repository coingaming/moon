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
    <div class="relative w-full">
      <TextArea
        class={merge([
          "appearance-none resize-none w-full p-4 text-moon-16 text-bulma bg-gohan",
          "rounded-moon-s-sm placeholder:text-trunks outline outline-1 outline-offset-[-1px] outline-beerus",
          "transition-all focus:outline-2 focus:outline-offset-[-2px] focus:outline-piccolo hover:outline-1",
          "hover:outline-offset-[-1px] hover:outline-bulma/[0.12]",
          @disabled && "opacity-30 cursor-not-allowed",
          @class
        ])}
        {=@rows}
        {=@cols}
        opts={Map.merge(@attrs, %{disabled: @disabled, placeholder: @placeholder})}
      />
      <#slot />
    </div>
    """
  end
end
